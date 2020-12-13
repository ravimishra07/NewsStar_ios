//
//  SearchViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 02/12/20.
//

import UIKit

class SearchViewController: UIViewController {
    
    //MARK:- Outlets
    @IBOutlet weak var searchView: SoftUIView!
    @IBOutlet weak var accBtn: SoftUIView!
    @IBOutlet weak var countryBtn: SoftUIView!
    @IBOutlet weak var bookMarkBtn: SoftUIView!
    @IBOutlet weak var accViewBtn: UIButton!
    @IBOutlet weak var countryViewBtn: UIButton!
    @IBOutlet weak var bookMarkViewBtn: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var filterStackView: UIStackView!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!

    //MARK:- Variables
    var page = 1
    var showFilter = false
    var newsDataSource = NewsDataSource()
    lazy var newsViewModel: NewsViewModel = {
        let viewModel = NewsViewModel(dataSource: newsDataSource)
        return viewModel
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        animateFilterView()
        setUIView()
    }
    
    func setUIView(){
        /*
        let c = getCountryList()
        let flag = getFlagScaler(country: c[0])
        searchTextField.text = c[0]
        countryViewBtn.setTitle("\(c[0])", for: .normal)
        //let str : String = "Smiley \u{1F603}"
        searchTextField.text = flag
       // CountryPi
        
        */
        accBtn.type = .pushButton
        countryBtn.type = .pushButton
        bookMarkBtn.type = .pushButton
        let accBtnTap = UITapGestureRecognizer(target: self, action: #selector(self.handleAccTap(_:)))
        accBtn.addGestureRecognizer(accBtnTap)
        let countryTap = UITapGestureRecognizer(target: self, action: #selector(self.handleCountryTap(_:)))
        countryBtn.addGestureRecognizer(countryTap)
        let bookmarkTap = UITapGestureRecognizer(target: self, action: #selector(self.handleBookmarkTap(_:)))
        bookMarkBtn.addGestureRecognizer(bookmarkTap)
       
        newsCollectionView.layer.cornerRadius = 12
        view.backgroundColor =  UIColor(named: "MainBackgroundColor")
        self.newsCollectionView.register(UINib(nibName: "NewsCollectionCell", bundle: nil), forCellWithReuseIdentifier: NewsCollectionCell.description())

        newsCollectionView.delegate = self
        newsCollectionView.dataSource = self.newsDataSource
        
        self.newsDataSource.data.addAndNotify(observer: self) { [weak self] _ in
            self?.newsCollectionView.reloadData()
        }

        self.newsViewModel.onErrorHandling = { [weak self] error in
            // display error
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
        
        searchButton.layer.cornerRadius = 20
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var defaultQuery = "India"
        if searchTextField.text != ""{
            defaultQuery = searchTextField.text ?? "India"
        }
            newsViewModel.fetchNews(query: defaultQuery, page: page, context: self, isPaginating: false)

    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        Global.page = 1
        Global.searchText = "news"
    }
    @objc func handleAccTap(_ sender: UITapGestureRecognizer? = nil) {
        print("----------------------------one taped----------------")
    }
  
    @objc func handleCountryTap(_ sender: UITapGestureRecognizer? = nil) {
        print("----------------------------two taped----------------")

    }
    
    @objc func handleBookmarkTap(_ sender: UITapGestureRecognizer? = nil) {
        print("----------------------------three taped----------------")

    }
    func getCountryList()->[String]{
//        var countries: [String] = []
//        for code in NSLocale.isoCountryCodes  {
//            let id = NSLocale.localeIdentifier(fromComponents: [NSLocale.Key.countryCode.rawValue: code])
//
////            guard let name = NSLocale(localeIdentifier: "en_UK").displayName(forKey: NSLocale.Key.identifier, value: id) else{
////                print("Country not found for code: \(code)")
////                return []
////            }
////
//            countries.append(code)
//        }
//        return countries
    }
    func getFlagScaler(country:String) -> String {
        let base : UInt32 = 127397
        var s = ""
        for v in country.unicodeScalars {
            s.unicodeScalars.append(UnicodeScalar(base + v.value)!)
        }
        return String(s)
    }
    
    func animateFilterView(){
        if showFilter{
            filterBtn.tintColor = UIColor("ED4041")
            collectionViewTopConstraint.constant = 60

            UIView.animate(withDuration: 0.3) {
                self.filterStackView.transform = .identity
                self.view.layoutIfNeeded()
            }
        }else{
            filterBtn.tintColor = .black
            collectionViewTopConstraint.constant = 12
            UIView.animate(withDuration: 0.3) {
                self.filterStackView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
                self.view.layoutIfNeeded()
            }
        }
        showFilter = !showFilter

    }
    @IBAction func filterBtnTapped(_ sender: UIButton){
        animateFilterView()
    }
    @IBAction func searchTapped(_ sender: UIButton){
        if let searchText = searchTextField.text{
            if searchText != ""{
                Global.page = 1
                self.newsViewModel.fetchNews(query: searchText, page: 1,context: self)
            }
        }
    }
}
extension SearchViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let url = newsViewModel.dataSource?.data.value[indexPath.row].url else {
            return
        }
        let vc = self.storyboard?.instantiateViewController(withIdentifier: FullNewsVC.description()) as! FullNewsVC
        vc.newsUrl = url
        self.present(vc, animated: true, completion: nil)
    }

    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (newsCollectionView.contentOffset.y + newsCollectionView.frame.size.height) >= newsCollectionView.contentSize.height - 20 {
            page += 1
            var defaultQuery = "india"
            if searchTextField.text != "" {
                defaultQuery = "india"
            }
            newsViewModel.fetchNews(query: defaultQuery, page: page, context: self, isPaginating: true)
        }
    }
}
