//
//  ShimmerTVCell.swift
//  NewsStar
//
//  Created by Ravi Mishra on 06/12/20.
//

import UIKit

class ShimmerTVCell: UITableViewCell {
    //MARK:- Outlets
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    var shimmerLayer: Shimmer?

    override class func description() -> String {
      return  "ShimmerTVCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        addShimmerLayer(view: newsImage)
        addShimmerLayer(view: newsTitleLabel)
        addShimmerLayer(view: newsDescLabel)
        addShimmerLayer(view: dateView)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func addShimmerLayer(view: UIView){
    
        shimmerLayer = Shimmer(for: view, cornerRadius: 12)
        if let shimLayer = shimmerLayer{
            self.contentView.layer.insertSublayer(shimLayer, above: view.layer)
            shimLayer.startAnimation()
        }else{
            print("shimmer - layer not found ")
        }
    }
    func removeShimmerLayer(){
        shimmerLayer?.removeAllAnimations()
    }
}
