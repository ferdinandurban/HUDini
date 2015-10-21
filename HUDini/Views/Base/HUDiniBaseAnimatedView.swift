//
//  HUDiniBaseAnimatedView.swift
//  HUDini
//
//  Created by Ferdinand Urban on 17/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

public class HUDiniBaseAnimatedView: HUDiniBaseSquareView, HUDiniAnimation {
    
    let defaultAnimationShapeLayer: CAShapeLayer = {
        let defaultPath = UIBezierPath()
        defaultPath.moveToPoint(CGPointMake(4.0, 27.0))
        defaultPath.addLineToPoint(CGPointMake(34.0, 56.0))
        defaultPath.addLineToPoint(CGPointMake(88.0, 0.0))
        
        let layer           = CAShapeLayer()
        layer.frame         = CGRectMake(3.0, 3.0, 88.0, 56.0)
        layer.path          = defaultPath.CGPath
        layer.fillMode      = kCAFillModeForwards
        layer.lineCap       = kCALineCapRound
        layer.lineJoin      = kCALineJoinRound
        layer.fillColor     = nil
        layer.strokeColor   = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).CGColor
        layer.lineWidth     = 6.0
        
        return layer
        }()
    
    var shapeLayer: CAShapeLayer?
    
    public override init() {
        super.init(frame: HUDiniBaseSquareView.defaultBaseFrame)
        shapeLayer = defaultAnimationShapeLayer
    }
    
    public init(withShape shape: HUDiniAnimatedShapeLayers.Code) {
        super.init(frame: HUDiniBaseSquareView.defaultBaseFrame)
        
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}