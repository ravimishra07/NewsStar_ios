//
//  OnBoardingCVCell.swift
//  NewsStar
//
//  Created by Ravi Mishra on 21/12/20.
//

import UIKit

class OnBoardingCVCell: UICollectionViewCell {
   // @IBOutlet weak var imageBackView: UIView!
   @IBOutlet weak var onBoardingTitle: UILabel!
    @IBOutlet weak var onBoardingSubTitle: UILabel!
    @IBOutlet weak var onBoardingImage: UIImageView!

    
    override class func description() -> String {
        "OnBoardingCVCell"
    }
    override  func awakeFromNib() {
      //  self.contentView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
       // imageBackView.layer. = imageBackView.frame.width/2
       

    
    }
}
