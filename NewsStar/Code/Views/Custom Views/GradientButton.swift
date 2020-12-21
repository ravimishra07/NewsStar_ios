//
//  GradientButton.swift
//  NewsStar
//
//  Created by Ravi Mishra on 20/12/20.
//

import UIKit

class GradientButton: UIButton {
    var topColor = UIColor("#ff7e5f")?.cgColor ?? UIColor.black.cgColor
    var bottomColor = UIColor("#feb47b")?.cgColor ?? UIColor.black.cgColor
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
    }
    
    private lazy var gradientLayer: CAGradientLayer = {
        let l = CAGradientLayer()
        l.frame = self.bounds
        l.colors = [topColor, bottomColor]
        l.startPoint = CGPoint(x: 0, y: 0.5)
        l.endPoint = CGPoint(x: 1, y: 0.5)
        l.cornerRadius = 16
        layer.shadowColor = UIColor.black.withAlphaComponent(0.7).cgColor
        layer.shadowOffset = CGSize(width: 1, height: 1)
        layer.shadowRadius = 8
        layer.insertSublayer(l, at: 0)
        return l
    }()
}
