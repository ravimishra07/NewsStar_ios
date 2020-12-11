//
//  ShimmeringView.swift
//  NewsStar
//
//  Created by Ravi Mishra on 27/10/20.
//

import Foundation
#if canImport(UIKit)
import UIKit

final public class ShimmeringView: UIView {

    override public class var layerClass: Swift.AnyClass {
        return ShimmeringLayer.self
    }

    /// The content view to be shimmered
    public var contentView = UIView() {
        didSet {
            if oldValue != contentView {
                addSubview(contentView)
                shimmerLayer?.contentLayer = contentView.layer
            }
        }
    }

    /// Set to `true` to start shimmer animation, and `false` to stop. Detaults to `false`.
    public var isShimmering: Bool = false {
        didSet { shimmerLayer?.isShimmering = isShimmering }
    }

    /// The speed of the shimmer animation in points per second. The higher the number, the faster the animation.
    /// Defaults to 230.
    public var shimmerSpeed: CGFloat = 230.0 {
        didSet { shimmerLayer?.shimmerSpeed = shimmerSpeed }
    }

    /// The highlight length of the shimmer. Range of [0,1], defaults to 1.0.
    public var shimmerHighlightLength: CGFloat = 1.0 {
        didSet { shimmerLayer?.shimmerHighlightLength = shimmerHighlightLength }
    }

    /// The direction of the shimmer animation.
    /// Defaults to `.right`, which will run the animation from left to right.
    public var shimmerDirection: Shimmer.Direction = .right {
        didSet { shimmerLayer?.updateShimmering() }
    }

    /// The time interval between shimmers in seconds.
    /// Defaults to 0.4.
    public var shimmerPauseDuration: CFTimeInterval = 0.4 {
        didSet  { shimmerLayer?.shimmerPauseDuration = shimmerPauseDuration }
    }

    /// The opacity of the content during a shimmer. Defaults to 0.5.
    public var shimmerAnimationOpacity: CGFloat = 0.5 {
        didSet { shimmerLayer?.shimmerAnimationOpacity = shimmerAnimationOpacity }
    }

    /// The opacity of the content when not shimmering. Defaults to 1.0.
    public var shimmerOpacity: CGFloat = 1.0 {
        didSet { shimmerLayer?.shimmerOpacity = shimmerOpacity }
    }

    /// The absolute CoreAnimation media time when the shimmer will begin.
    public var shimmerBeginTime: CFTimeInterval = .greatestFiniteMagnitude {
        didSet { shimmerLayer?.shimmerBeginTime = shimmerBeginTime }
    }

    /// The duration of the fade used when the shimmer begins. Defaults to 0.1.
    public var shimmerBeginFadeDuration: CFTimeInterval = 0.1 {
        didSet { shimmerLayer?.shimmerBeginFadeDuration = shimmerBeginFadeDuration }
    }

    /// The duration of the fade used when the shimmer ends. Defaults to 0.3.
    public var shimmerEndFadeDuration: CFTimeInterval = 0.3 {
        didSet { shimmerLayer?.shimmerEndFadeDuration = shimmerEndFadeDuration }
    }

    /// The absolute CoreAnimation media time when the shimmer will fade in.
    public var shimmerFadeTime: CFTimeInterval? {
        didSet { shimmerLayer?.shimmerFadeTime = shimmerFadeTime }
    }

    override public func layoutSubviews() {
        contentView.bounds = self.bounds
        contentView.center = self.center
        super.layoutSubviews()
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    private var shimmerLayer: ShimmeringLayer? {
        return (layer as? ShimmeringLayer)
    }

}
#endif
