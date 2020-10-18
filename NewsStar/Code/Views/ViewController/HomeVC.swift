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
    @IBOutlet weak var dummyView: UIView!
    @IBOutlet weak var mainView: UIView!

    let darkShadow = CALayer()
    let lightShadow = CALayer()
    
    // MARK:- lifeCycle methods for the viewController
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

}
