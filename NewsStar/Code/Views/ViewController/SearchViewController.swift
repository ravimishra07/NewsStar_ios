//
//  SearchViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 02/12/20.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchView: SoftUIView!
    @IBOutlet weak var searchTextField: UITextField!
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
        view.backgroundColor =  UIColor(named: "MainBackgroundColor")
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
                self.filterStackView.transform = CGAffineTransform(translationX: self.filterStackView.bounds.width, y: 0)
            }
        }
        showFilter = !showFilter

    }
    @IBAction func filterBtnTapped(_ sender: UIButton){
        animateFilterView()
    }
}
