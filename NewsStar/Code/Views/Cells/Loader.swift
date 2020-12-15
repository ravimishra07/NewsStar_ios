//
//  Loader.swift
//  VideoCallKitQuickStart
//
//  Created by Ravi Mishra on 06/10/20.
//  Copyright © 2020 Twilio, Inc. All rights reserved.
//


import Foundation
import UIKit

class Loader: UIView {
    static let instance = Loader()
    @IBOutlet var contentView: UIView!
    @IBOutlet var backgroundView: UIView!

    
    @IBOutlet weak var loaderImage: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Bundle.main.loadNibNamed("Loader", owner: self, options: nil)
        self.commit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("init(coder:) has not be implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.commit()
    }
    
    private func commit(){
        self.contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        backgroundView.alpha = 0.3
        rotateView(targetView: loaderImage)
    }
    
    func start(viewController : UIViewController) {
        viewController.view.addSubview(contentView)
    }
    
    func stop() {
        contentView.removeFromSuperview()
    }
    private func rotateView(targetView: UIView, duration: Double = 1.0) {
        UIView.animate(withDuration: duration, delay: 0.0, options: .curveLinear, animations: {
            targetView.transform = targetView.transform.rotated(by: CGFloat(Double.pi))
        }) { finished in
            self.rotateView(targetView: targetView, duration: duration)
        }
    }
}
