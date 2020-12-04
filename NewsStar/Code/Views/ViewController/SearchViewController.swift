//
//  SearchViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 02/12/20.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchView: SoftUIView!
    @IBOutlet weak var accBtn: SoftUIView!
    @IBOutlet weak var countryBtn: SoftUIView!
    @IBOutlet weak var bookMarkBtn: SoftUIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var filterBtn: UIButton!
    @IBOutlet weak var filterStackView: UIStackView!
    var showFilter = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animateFilterView()
        setUIView()
    }
    
    func setUIView(){
        accBtn.type = .pushButton
        countryBtn.type = .pushButton
        bookMarkBtn.type = .pushButton
        view.backgroundColor =  UIColor(named: "MainBackgroundColor")
        self.newsCollectionView.register(UINib(nibName: "NewsCollectionCell", bundle: nil), forCellWithReuseIdentifier: NewsCollectionCell.description())
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
