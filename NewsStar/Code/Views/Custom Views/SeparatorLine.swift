//
//  SeparatorLine.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit

@IBDesignable class SeparatorLine: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 4 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    var background: UIColor = UIColor.systemGreen {
        didSet {
            self.backgroundColor = background
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
        self.backgroundColor = background
    }
   
}
