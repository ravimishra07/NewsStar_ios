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
        self.newsViewModel.fetchNews(query: "news")
        searchButton.layer.cornerRadius = 20
    }
    func animateFilterView(){
        if showFilter{
            filterBtn.tintColor = UIColor("ED4041")
            UIView.animate(withDuration: 0.6) {
                self.filterStackView.transform = .identity
            }
        }else{
            filterBtn.tintColor = .black
            UIView.animate(withDuration: 0.6) {
                self.filterStackView.transform = CGAffineTransform(translationX: self.view.bounds.width, y: 0)
            }
        }
        showFilter = !showFilter

    }
    @IBAction func filterBtnTapped(_ sender: UIButton){
        animateFilterView()
    }
}
extension SearchViewController: UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.bounds.width, height: 300)
    }
}
