//
//  HUDiniAnimatedLayers.swift
//  HUDini
//
//  Created by Ferdinand Urban on 17/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit
import Darwin

public struct HUDiniAnimatedShapeLayers {
    public enum Code: Int {
        case clearShape = 1000
        case activityIndicator
        case checkMarkShape
        case crossMarkShape
        case circleShape
    }
    
    let π = M_PI
    let shapeCode: Code
    let defaultFrame = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 100.0)
    let defaultColor = UIColor(red: 0.15, green: 0.15, blue: 0.15, alpha: 1.0).CGColor
    let defaultCenter = CGPoint(x: 0.0, y: 0.0)
    
    func drawShape(code: HUDiniAnimatedShapeLayers.Code) -> CAShapeLayer {
        switch (code) {
        case .clearShape: return clearMark()
        case .activityIndicator: return activityIndicatorMark()
        case .checkMarkShape: return checkMark()
        case .crossMarkShape: return crossMark()
        case .circleShape: return circleMark(withRadius: 1.0)
        }
    }
    
    func activityIndicatorMark() -> CAShapeLayer {
        let ballPath = UIBezierPath(arcCenter: defaultCenter, radius: 3.0, startAngle: 0.0, endAngle: 6.28, clockwise: true)
        
        let layer           = CAShapeLayer()
        layer.frame         = defaultFrame
        layer.path          = ballPath.CGPath
        layer.fillMode      = kCAFillModeForwards
        layer.lineCap       = kCALineCapRound
        layer.lineJoin      = kCALineJoinRound
        layer.fillColor     = nil
        layer.strokeColor   = defaultColor
        layer.lineWidth     = 6.0
        
        return layer
        
    }
    
    func checkMark() -> CAShapeLayer {
        let path = UIBezierPath()
        
        path.moveToPoint(CGPointMake(15.0, 50.0))
        path.addLineToPoint(CGPointMake(50.0, 80.0))
        path.addLineToPoint(CGPointMake(90.0, 15.0))
        
        let layer           = CAShapeLayer()
        layer.frame         = defaultFrame
        layer.path          = path.CGPath
        layer.fillMode      = kCAFillModeForwards
        layer.lineCap       = kCALineCapRound
        layer.lineJoin      = kCALineJoinRound
        layer.fillColor     = nil
        layer.strokeColor   = defaultColor
        layer.lineWidth     = 6.0
        
        return layer
    }

    func crossMark() -> CAShapeLayer {
        let path1 = UIBezierPath()
        
        path1.moveToPoint(CGPointMake(0.0, 80.0))
        path1.addLineToPoint(CGPointMake(80.0, 0.0))
        
        let path2 = UIBezierPath()
        path2.moveToPoint(CGPointMake(0.0, 0.0))
        path2.addLineToPoint(CGPointMake(80.0, 80.0))
    
        var combinedPath: CGMutablePathRef
        combinedPath = CGPathCreateMutableCopy(path1.CGPath)!
        CGPathAddPath(combinedPath, nil, path2.CGPath)
        
        let layer           = CAShapeLayer()
        layer.frame         = CGRect(x: 0.0, y: 0.0, width: 80.0, height: 80.0)
        layer.path          = combinedPath
        layer.fillMode      = kCAFillModeForwards
        layer.lineCap       = kCALineCapRound
        layer.lineJoin      = kCALineJoinRound
        layer.fillColor     = nil
        layer.strokeColor   = defaultColor
        layer.lineWidth     = 6.0
        
        return layer
    }
    
    func circleMark(withRadius radius: CGFloat) -> CAShapeLayer {
        let path = UIBezierPath(arcCenter: defaultCenter, radius: radius, startAngle: 0, endAngle: 180, clockwise: true)
        
        let layer = CAShapeLayer()
        layer.frame = defaultFrame
        layer.path = path.CGPath
        layer.fillMode = kCAFillModeForwards
        layer.lineCap     = kCALineCapRound
        layer.lineJoin    = kCALineJoinRound
        layer.fillColor   = nil
        layer.strokeColor = defaultColor
        layer.lineWidth   = 6.0
        
        return layer
    }
    
    func clearMark() -> CAShapeLayer {
        let path = UIBezierPath()
        
        let layer = CAShapeLayer()
        layer.frame = defaultFrame
        layer.path = path.CGPath
        
        
        return layer
    }
}
