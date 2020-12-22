//
//  ViewExtensions.swift
//  NewsStar
//
//  Created by Ravi Mishra on 29/09/20.
//

import UIKit
extension UIView{
    func perfectCorner(){
        layer.cornerRadius = bounds.height/2
    }
    func addCorner(radius: CGFloat = 4){
        layer.cornerRadius = radius
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
           let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
           let mask = CAShapeLayer()
           mask.path = path.cgPath
           layer.mask = mask
       }
    
    
    /* Usage Example
     * bgView.addBottomRoundedEdge(desiredCurve: 1.5)
     */
      func addBottomRoundedEdge(desiredCurve: CGFloat?) {
          let offset: CGFloat = self.frame.width / desiredCurve!
          let bounds: CGRect = self.bounds
          
          let rectBounds: CGRect = CGRect(x: bounds.origin.x, y: bounds.origin.y, width: bounds.size.width, height: bounds.size.height / 2)
          let rectPath: UIBezierPath = UIBezierPath(rect: rectBounds)
          let ovalBounds: CGRect = CGRect(x: bounds.origin.x - offset / 2, y: bounds.origin.y, width: bounds.size.width + offset, height: bounds.size.height)
          let ovalPath: UIBezierPath = UIBezierPath(ovalIn: ovalBounds)
          rectPath.append(ovalPath)
          
          // Create the shape layer and set its path
          let maskLayer: CAShapeLayer = CAShapeLayer()
          maskLayer.frame = bounds
          maskLayer.path = rectPath.cgPath
          
          // Set the newly created shape layer as the mask for the view's layer
          self.layer.mask = maskLayer
      }
}


extension UIColor {
    convenience init?(_ hexString: String) {
        var chars = Array(hexString.hasPrefix("#") ? hexString.dropFirst() : hexString[...])
        switch chars.count {
        case 3: chars = chars.flatMap { [$0, $0] }; fallthrough
        case 6: chars = ["F","F"] + chars
        case 8: break
        default: return nil
        }
        self.init(red: .init(strtoul(String(chars[2...3]), nil, 16)) / 255,
                  green: .init(strtoul(String(chars[4...5]), nil, 16)) / 255,
                  blue: .init(strtoul(String(chars[6...7]), nil, 16)) / 255,
                  alpha: .init(strtoul(String(chars[0...1]), nil, 16)) / 255)
    }
}
