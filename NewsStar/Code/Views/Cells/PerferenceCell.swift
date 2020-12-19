//
//  PerferenceCell.swift
//  NewsStar
//
//  Created by Ravi Mishra on 16/12/20.
//

import UIKit

class PerferenceCell: UICollectionViewCell {
    @IBOutlet weak var softView: SoftUIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var crossImage: UIImageView!
    @IBOutlet weak var topicName: UILabel!
    
    override class func description() -> String {
        "PerferenceCell"
    }
    override  func awakeFromNib() {
        self.mainView.layer.cornerRadius = 20
        
        
    }
}
