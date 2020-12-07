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
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var filterStackView: UIStackView!
    @IBOutlet weak var collectionViewTopConstraint: NSLayoutConstraint!

    
    //MARK:- Variables
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
        if Global.searchText != ""{
            self.searchTextField.text = Global.searchText
            self.newsViewModel.fetchNews(query: Global.searchText)
            Global.searchText = ""
        }else{
            self.newsViewModel.fetchNews(query: "news")
        }
    }
    @objc func handleAccTap(_ sender: UITapGestureRecognizer? = nil) {
    }
  
    @objc func handleCountryTap(_ sender: UITapGestureRecognizer? = nil) {
    }
    
    @objc func handleBookmarkTap(_ sender: UITapGestureRecognizer? = nil) {
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
                self.newsViewModel.fetchNews(query: searchText)
            }
        }
    }
}
extension SearchViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 300)
    }
}
