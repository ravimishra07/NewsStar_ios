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
    @IBOutlet weak var bDateView: UIView!

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
}
