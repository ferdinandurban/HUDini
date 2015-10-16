//
//  HUDiniSuccess.swift
//  HUDini
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

public class HUDiniSuccess: HUDiniBaseSquareView, HUDiniAnimation {
    
    var checkmarkShapeLayer: CAShapeLayer = {
        let checkmarkPath = UIBezierPath()
        checkmarkPath.moveToPoint(CGPointMake(4.0, 27.0))
        checkmarkPath.addLineToPoint(CGPointMake(34.0, 56.0))
        checkmarkPath.addLineToPoint(CGPointMake(88.0, 0.0))
        
        let layer = CAShapeLayer()
        layer.frame = CGRectMake(3.0, 3.0, 88.0, 56.0)
        layer.path = checkmarkPath.CGPath
        layer.fillMode = kCAFillModeForwards
        layer.lineCap     = kCALineCapRound
        layer.lineJoin    = kCALineJoinRound
        layer.fillColor   = nil
        layer.strokeColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).CGColor
        layer.lineWidth   = 6.0
        
        return layer
        }()

    public required override init() {
        super.init()
        
        layer.addSublayer(checkmarkShapeLayer)
        checkmarkShapeLayer.position = layer.position
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.addSublayer(checkmarkShapeLayer)
        checkmarkShapeLayer.position = layer.position
    }
    
    public func startAnimation() {
        let checkmarkStrokeAnimation = CAKeyframeAnimation(keyPath:"strokeEnd")
        checkmarkStrokeAnimation.values = [0, 1]
        checkmarkStrokeAnimation.keyTimes = [0, 1]
        checkmarkStrokeAnimation.duration = 0.35
        
        checkmarkShapeLayer.addAnimation(checkmarkStrokeAnimation, forKey:"checkmarkStrokeAnim")
    }
    
    public func stopAnimation() {
        checkmarkShapeLayer.removeAnimationForKey("checkmarkStrokeAnimation")
    }
}
