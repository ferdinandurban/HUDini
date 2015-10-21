//
//  HUDiniAnimatedView.swift
//  HUDini
//
//  Created by Ferdinand Urban on 17/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

public class HUDiniAnimatedView: HUDiniBaseAnimatedView {
    
    var defaultShapeLayer = HUDiniAnimatedShapeLayers(shapeCode: .clearShape)
    var markShapeLayer: CAShapeLayer?

    // MARK: - Init
    public required override init(withShape shape: HUDiniAnimatedShapeLayers.Code) {
        super.init(withShape: shape)
        
        let shapeLayer = defaultShapeLayer.drawShape(shape)
        markShapeLayer = shapeLayer
        
        layer.addSublayer(shapeLayer)
        markShapeLayer!.position = layer.position
    }

    public required init(withCircleShape shape: HUDiniAnimatedShapeLayers.Code = .circleShape, radius: CGFloat) {
        super.init(withShape: shape)
        
        let shapeLayer = defaultShapeLayer.drawShape(shape)
        markShapeLayer = shapeLayer
        
        layer.addSublayer(shapeLayer)
        markShapeLayer!.position = layer.position
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        layer.addSublayer(markShapeLayer!)
        markShapeLayer!.position = layer.position
    }
    
    // MARK: - Animations
    public func startAnimation() {
        print("start animation")
        
        let markStrokeAnimation = CAKeyframeAnimation(keyPath:"strokeEnd")
    
        markStrokeAnimation.values = [0, 1]
        markStrokeAnimation.keyTimes = [0, 1]
        markStrokeAnimation.duration = 0.35
        
        markShapeLayer!.addAnimation(markStrokeAnimation, forKey:"markStrokeAnimation")
    }
    
    public func stopAnimation() {
        print("stop animation")
        markShapeLayer!.removeAnimationForKey("markStrokeAnimation")
    }
    
    
    // MARK: - Internal Methods
//    internal func circleShapeInit(radius: CGFloat) -> CAShapeLayer {
//        let shape = HUDiniAnimatedShapeLayers(shapeCode: .circleShape)
//        
//        
//        return d
//    }
   
}


