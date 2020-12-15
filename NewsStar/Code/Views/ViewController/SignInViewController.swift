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
   // @IBOutlet weak var signInButton: GIDSignInButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance().signIn()
        // Do any additional setup after loading the view.
    }
}
