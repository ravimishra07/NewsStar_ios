//
//  CircleImageView.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit

@IBDesignable class CircleButton: UIButton {
    
    @IBInspectable var cornerRadius: CGFloat = 30 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
 
    override func prepareForInterfaceBuilder() {
        self.prepareViews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.prepareViews()
    }
   
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        prepareViews()
    }
    
    func prepareViews(){
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
       
    }
   
}

