//
//  MenuCVCell.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import UIKit

class MenuCVCell: UICollectionViewCell {
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var imgBackgroundView: UIView!


    override func awakeFromNib() {
        super.awakeFromNib()
        menuImage.perfectCorner()
        imgBackgroundView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
        imgBackgroundView.perfectCorner()
        // Initialization code
    }

}
