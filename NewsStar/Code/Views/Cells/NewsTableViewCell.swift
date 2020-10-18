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

    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    func setUpUI(){
        dateView.perfectCorner()
        newsImage.addCorner()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
