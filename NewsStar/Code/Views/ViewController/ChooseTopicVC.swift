//
//  ChooseTopicVC.swift
//  NewsStar
//
//  Created by Ravi Mishra on 15/11/20.
//

import UIKit

class ChooseTopicVC: UIViewController {
  

    @IBOutlet weak var testView: NeumorphicUIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.type = .toggleButton
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)


        // Do any additional setup after loading the view.
    }
}
