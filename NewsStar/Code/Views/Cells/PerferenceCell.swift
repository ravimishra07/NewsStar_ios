//
//  PerferenceCell.swift
//  NewsStar
//
//  Created by Ravi Mishra on 16/12/20.
//

import UIKit

class PerferenceCell: UICollectionViewCell {
    @IBOutlet weak var softView: SoftUIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var crossImage: UIImageView!
    @IBOutlet weak var topicName: UILabel!
    
    override class func description() -> String {
        "PerferenceCell"
    }
    override  func awakeFromNib() {
        self.mainView.layer.cornerRadius = 20
        
        
    }
    func rotateImage(isSelected: Bool){
        if isSelected{
            UIView.animate(withDuration: 0.6, delay: 0, options: [.curveEaseIn]) {
                self.crossImage.transform = CGAffineTransform(rotationAngle: .pi/4)
                self.mainView.backgroundColor = UIColor("#feb47b")
                
            } completion: { (isCompleted) in
                /// set value in preference
            }
        }else{
            UIView.animate(withDuration: 0.6, delay: 0, options: [.curveEaseIn]) {
                self.crossImage.transform = .identity
                self.mainView.backgroundColor = .clear

            } completion: { (isCompleted) in
                /// set value in preference
            }

            
        }
    }
}
