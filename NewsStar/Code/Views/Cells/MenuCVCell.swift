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
    @IBOutlet weak var imgBackgroundView: SoftUIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        menuImage.perfectCorner()
        imgBackgroundView.type = .normal
        contentView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        imgBackgroundView.backgroundColor = UIColor.systemGray.withAlphaComponent(0.3)
        imgBackgroundView.type = .toggleButton
        imgBackgroundView.perfectCorner()

    }
    func addShimmerLayer(view: UIView){
//        let shimmerLayer = Shimmer(for: view, cornerRadius: 12)
//        self.contentView.layer.insertSublayer(shimmerLayer, above: view.layer)
//        shimmerLayer.startAnimation()
    }
    
}
