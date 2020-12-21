//
//  SignInViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 13/12/20.
//

import UIKit
import GoogleSignIn
import Firebase


class SignInViewController: UIViewController {
    @IBOutlet weak var signinButton: UIButton!
    @IBOutlet weak var backView: SoftUIView!
    @IBOutlet weak var onBoardingCV: UICollectionView!
    
   override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        signinButton.titleLabel?.textColor = .black

    }
    @IBAction func googleSignIn(sender: AnyObject) {
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
      }
}
