//
//  SearchViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 02/12/20.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var serachView: SoftUIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUIView()
    }
    func setUIView(){
        searchButton.layer.cornerRadius  = 20
    }
}
