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
