//
//  MainGradientView.swift
//  NewsStar
//
//  Created by Ravi Mishra on 13/11/20.
//

import UIKit
@IBDesignable class MainGradientView: UIView{
    //#ffafbd → #ffc3a0
    @IBInspectable var topColor: UIColor = UIColor("#ff7e5f") ?? .white
    @IBInspectable var bottomColor: UIColor = UIColor("#feb47b") ?? .black
    
    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }
    override func awakeFromNib() {
       super.awakeFromNib()
       //custom logic goes here
        self.addBottomRoundedEdge(desiredCurve: 1.5)
    }
    override func layoutSubviews() {
        (layer as! CAGradientLayer).colors = [topColor.cgColor, bottomColor.cgColor]
    }
    func addCurveLayer(){
        let path = UIBezierPath()
        path.addArc(withCenter: CGPoint(x: self.bounds.width/2, y: self.bounds.height), radius: 200, startAngle: CGFloat(0), endAngle: .pi, clockwise: true)
        let shape = CAShapeLayer()
        shape.path = path.cgPath
        let fillColor  = UIColor.red.withAlphaComponent(0.2)
        shape.fillColor = fillColor.cgColor
        self.layer.addSublayer(shape)
    }
}
