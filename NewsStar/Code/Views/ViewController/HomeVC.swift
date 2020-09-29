//
//  ViewController.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var topPicksForYouCollectionView: UICollectionView!
    
    // MARK:- lifeCycle methods for the viewController
    override class func description() -> String {
        "HomeVC"
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCollectionView(cv: topPicksForYouCollectionView, with: NewsCollectionCell().asNib(), and: NewsCollectionCell.description())
    }
    
    func setCollectionView(cv collectionView: UICollectionView, with nib: UINib, and identifier: String){
        //        collectionView.dataSource = self
        //        collectionView.delegate = self
        collectionView.register(nib, forCellWithReuseIdentifier: identifier)
    }
}

