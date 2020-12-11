//
//  NewsCollectionCell.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit

class NewsCollectionCell: UICollectionViewCell {

   
    //MARK:- Outlets
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var backView: NeumorphicUIView!
    
    @IBOutlet weak var bImageView: UIView!
    @IBOutlet weak var bTitleView: UIView!
    @IBOutlet weak var bDescription: UIView!

    let startColor = UIColor("FF7E5F")?.withAlphaComponent(1).cgColor ?? UIColor.white.cgColor
    let endColor =  UIColor("DA573B")?.withAlphaComponent(1).cgColor ?? UIColor.white.cgColor
    
    var shimmerLayer=CAGradientLayer()
    var article: Article?{
        didSet{
            setData(article: article)
        }
    }
    
    override class func description() -> String {
        return "NewsCollectionCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    func setUpUI(){
        dateView.perfectCorner()
        backView.type = .normal
        mainView.layer.cornerRadius = 20
        newsImage.layer.cornerRadius = 20
        newsImage.clipsToBounds = true
        backView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        //        addShimmerLayer(view: newsDescLabel)
        //  addShimmerLayer(view: newsImage)
        //        addShimmerLayer(view: newsTitleLabel)
        //addShimmerLayer(view: dateView)
        // showShimmer(show: true)
        addShimmerLayer(view: contentView)
    }
    func setData(article: Article?){
        if let article = article{
           // showShimmer(show: false)
            newsTitleLabel.text = article.title
            newsDescLabel.text = article.articleDescription
            guard let url = URL(string: article.urlToImage ?? "") else{
                return
            }
            loadImage(from: url, imgView: newsImage)
        }
    }
    func addShimmerLayer(view: UIView){
        
        
        
        shimmerLayer.frame = view.bounds
        shimmerLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        shimmerLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        shimmerLayer.colors = [startColor, endColor, startColor]
        shimmerLayer.locations = [0.0, 0.5, 1.0]
        shimmerLayer.position = view.center
        shimmerLayer.cornerRadius = 12
            let animation = CABasicAnimation(keyPath: "locations")
            animation.fromValue = [-1.0, -0.5, 0.0]
            animation.toValue = [1.0, 1.5, 2.0]
            animation.repeatCount = .infinity
            animation.duration = 0.8
        shimmerLayer.add(animation, forKey: animation.keyPath)
        
        
        contentView.layer.insertSublayer(shimmerLayer, above: view.layer)

        
        
        
       // shimmerLayer = nil
//      let  shimmerLayer = Shimmer(for: view, cornerRadius: 12)
//        newsImage.layer.insertSublayer(shimmerLayer, above: view.layer)
//        newsTitleLabel.layer.insertSublayer(shimmerLayer, above: view.layer)
//        dateView.layer.insertSublayer(shimmerLayer, above: view.layer)
//       // newsDescLabel.layer.insertSublayer(shimmerLayer, above: view.layer)
//
//       // newsImage.layer.insertSublayer(shimmerLayer, at: .max)
//
//        shimmerLayer.startAnimation()
    }
//    func removeShimmer(){
//        shimmerLayer?.removeAllAnimations()
//    }
    func showShimmer(show: Bool){
//        addShimmerLayer(view: newsDescLabel)
//        addShimmerLayer(view: newsImage)
//        addShimmerLayer(view: newsTitleLabel)
        addShimmerLayer(view: dateView)
//        dateView.isHidden = show
//        backView.isHidden = show
//        mainView.isHidden = show
//        newsImage.isHidden = show
//        newsTitleLabel.isHidden = show
//        newsDescLabel.isHidden = show
//        backView.isHidden = show
//        if !show{
//           // removeShimmer()
//        }else{
//
//        }
    }
    
}
