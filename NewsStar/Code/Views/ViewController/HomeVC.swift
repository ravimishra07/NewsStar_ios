//
//  ViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit

class HomeVC: UIViewController {
    override class func description() -> String {
        "HomeVC"
    }
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var mainView: UIView!
    
    // MARK:- lifeCycle methods for the viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUI()
    }
    
    func setUpUI(){
        searchTextField.delegate = self
        searchButton.layer.cornerRadius  = 4
    }
}
extension HomeVC: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTextField.resignFirstResponder()
        return true
    }
}
