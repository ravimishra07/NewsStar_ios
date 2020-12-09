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
    var shimmerLayer: Shimmer?
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
        showLoadedViews(show: false)
    }
    func setData(article: Article?){
        if let article = article{
            showLoadedViews(show: true)
            newsTitleLabel.text = article.title
            newsDescLabel.text = article.articleDescription
            guard let url = URL(string: article.urlToImage ?? "") else{
                return
            }
            loadImage(from: url, imgView: newsImage)
        }
    }
    func addShimmerLayer(view: UIView){
        shimmerLayer = Shimmer(for: view, cornerRadius: 12)
        view.layer.insertSublayer(shimmerLayer!, above: view.layer)
        shimmerLayer?.startAnimation()
    }
    func removeShimmer(){
        shimmerLayer?.removeAllAnimations()
    }
    func showLoadedViews(show: Bool){
        dateView.isHidden = show
        backView.isHidden = show
        mainView.isHidden = show
        newsImage.isHidden = show
        newsTitleLabel.isHidden = show
        newsDescLabel.isHidden = show
        backView.isHidden = show
        if show{
            removeShimmer()
        }else{
            addShimmerLayer(view: newsImage)
            addShimmerLayer(view: newsDescLabel)
            addShimmerLayer(view: newsTitleLabel)
            addShimmerLayer(view: dateView)
        }
    }
    
}
