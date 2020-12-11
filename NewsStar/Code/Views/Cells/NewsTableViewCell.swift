//
//  NewsTableViewCell.swift
//  NewsStar
//
//  Created by Ravi Mishra on 18/10/20.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    //MARK:- Outlets
    @IBOutlet weak var dateView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var newsTitleLabel: UILabel!
    @IBOutlet weak var newsDescLabel: UILabel!
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var backView: NeumorphicUIView!
    

     
    var article: Article?{
        didSet{
            setData(article: article)
        }
    }
    
    override class func description() -> String {
       return "NewsTableViewCell"
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
        // Initialization code
    }
    func setUpUI(){
        dateView.perfectCorner()
        backView.type = .normal
        mainView.layer.cornerRadius = 20
        newsImage.layer.cornerRadius = 20
        newsImage.clipsToBounds = true
        backView.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        self.addShimmerLayer(view: self.newsImage)
        self.layoutSubviews()
        
    }
    
    func setData(article: Article?){
        if let article = article{
            newsTitleLabel.text = article.title
            newsDescLabel.text = article.articleDescription
            
            guard let url = URL(string: article.urlToImage ?? "") else{
                return
            }
            loadImage(from: url, imgView: newsImage)
        }
        
    }
    
    func addShimmerLayer(view: UIView){
//        let shimmerLayer = Shimmer(for: view, cornerRadius: 12)
//        self.contentView.layer.insertSublayer(shimmerLayer, above: view.layer)
//        shimmerLayer.startAnimation()
    }
    
}
