//
//  OnBoardingCVCell.swift
//  NewsStar
//
//  Created by Ravi Mishra on 21/12/20.
//

import UIKit

class OnBoardingCVCell: UICollectionViewCell {
     @IBOutlet weak var imageBackView: SoftUIView!
    @IBOutlet weak var onBoardingTitle: UILabel!
    @IBOutlet weak var onBoardingSubTitle: UILabel!
    @IBOutlet weak var onBoardingImage: UIImageView!
    
    override class func description() -> String {
        "OnBoardingCVCell"
    }
    override  func awakeFromNib() {
        imageBackView.cornerRadius = imageBackView.bounds.width/2
        imageBackView.isSelected = true
       
    }
}
