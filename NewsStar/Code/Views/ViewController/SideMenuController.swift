//
//  SideMenuController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 27/10/20.
//

import UIKit

class SideMenuController: UIViewController {

    @IBOutlet weak var menuButton: UIButton!

    override class func description() -> String {
       return "SideMenuController"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       

        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.view.backgroundColor = .clear
        UIView.animate(withDuration: 0.6) {
            self.menuButton.transform = CGAffineTransform(rotationAngle: .pi/2)
        } completion: { (isTrue) in
            
        }
        //self.view.transform = CGAffineTransform(scaleX: <#T##CGFloat#>, y: <#T##CGFloat#>)
    }
//
    @IBAction func backButton(_ sender: UIButton){
        self.dismiss(animated: true, completion: nil)
    }

}
