//
//  ChooseTopicVC.swift
//  NewsStar
//
//  Created by Ravi Mishra on 15/11/20.
//

import UIKit

class ChooseTopicVC: UIViewController {
    @IBOutlet weak var bottomView1: UIView!
    @IBOutlet weak var bottomView2: UIView!
    @IBOutlet weak var bottomView3: UIView!



    @IBOutlet weak var testView: NeumorphicUIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        testView.type = .toggleButton
        self.view.backgroundColor = #colorLiteral(red: 0.9333333333, green: 0.9333333333, blue: 0.9333333333, alpha: 1)
        setUpView()
        // Do any additional setup after loading the view.
    }
    func setUpView(){
        let circlePath = UIBezierPath(arcCenter: CGPoint(x: (bottomView1.bounds.size.width / 2) + 5, y: (bottomView1.bounds.size.width) ), radius: bottomView1.bounds.size.height, startAngle: 0.0, endAngle: .pi, clockwise: false)
        let circleShape = CAShapeLayer()
        circleShape.path = circlePath.cgPath
        bottomView1.layer.mask = circleShape
    }
}
extension UIView {

func addTopRoundedCornerToView(targetView:UIView?, desiredCurve:CGFloat?){
    let offset:CGFloat =  targetView!.frame.width/desiredCurve!
    let bounds: CGRect = targetView!.bounds

    //Top side curve
    let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y+bounds.size.height / 2, width: bounds.size.width, height: bounds.size.height / 2)

    let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)

    //Top side curve
    let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)

    let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
    rectPath.append(ovalPath)

    // Create the shape layer and set its path
    let maskLayer: CAShapeLayer = CAShapeLayer()
    maskLayer.frame = bounds
    maskLayer.path = rectPath.cgPath

    // Set the newly created shape layer as the mask for the view's layer
    targetView!.layer.mask = maskLayer
}

    func setTopCurve(){
           let offset = CGFloat(self.frame.size.height/4)
           let bounds = self.bounds
           let rectBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y + bounds.size.height/2  , width:  bounds.size.width, height: bounds.size.height / 2)

           let rectPath = UIBezierPath(rect: rectBounds)

         let ovalBounds = CGRect(x: bounds.origin.x , y: bounds.origin.y - offset / 2, width: bounds.size.width + offset, height: bounds.size.height)
           let ovalPath = UIBezierPath(ovalIn: ovalBounds)
       rectPath.append(ovalPath)

           let maskLayer = CAShapeLayer.init()
           maskLayer.frame = bounds
           maskLayer.path = rectPath.cgPath
           self.layer.mask = maskLayer
       }

    func addBottomRoundedCornerToView(targetView:UIView?, desiredCurve:CGFloat?){
    let offset:CGFloat =  targetView!.frame.width/desiredCurve!
    let bounds: CGRect = targetView!.bounds

    //Bottom side curve
    let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)

    let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)

    //Bottom side curve
    let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)

    let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
    rectPath.append(ovalPath)

    // Create the shape layer and set its path
    let maskLayer: CAShapeLayer = CAShapeLayer()
    maskLayer.frame = bounds
    maskLayer.path = rectPath.cgPath
    
    // Set the newly created shape layer as the mask for the view's layer
    targetView!.layer.mask = maskLayer
}
    
    func setBottomCurve(){
        let offset = CGFloat(self.frame.size.height/4)
        let bounds = self.bounds
        
        let rectBounds = CGRect(x: bounds.origin.x, y: bounds.origin.y  , width:  bounds.size.width, height: bounds.size.height / 2)
        let rectPath = UIBezierPath(rect: rectBounds)
        let ovalBounds = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
        
        let ovalPath = UIBezierPath(ovalIn: ovalBounds)
        rectPath.append(ovalPath)
        
        let maskLayer = CAShapeLayer.init()
        maskLayer.frame = bounds
        maskLayer.path = rectPath.cgPath
        self.layer.mask = maskLayer
    }
}
