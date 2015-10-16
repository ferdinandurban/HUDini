//
//  HUDiniFrameView.swift
//  HUDini
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

internal class HUDiniFrameView: UIVisualEffectView {

    private var _content = UIView()
    internal var content: UIView {
        get {
            return _content
        }
        set {
            _content.removeFromSuperview()
            _content = newValue
            _content.alpha = 0.85
            _content.clipsToBounds = true
            _content.contentMode = .Center
            frame.size = _content.bounds.size
            addSubview(_content)
        }
    }

    internal init() {
        super.init(effect: UIBlurEffect(style: .Light))
        HUDiniFrameViewInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        HUDiniFrameViewInit()
    }
    
    private func HUDiniFrameViewInit() {
        backgroundColor = UIColor(white: 0.8, alpha: 0.36)
        layer.cornerRadius = 9.0
        layer.masksToBounds = true
        
        contentView.addSubview(self.content)
        
        let offset = 20.0
        
        let motionEffectsX = UIInterpolatingMotionEffect(keyPath: "center.x", type: .TiltAlongHorizontalAxis)
        motionEffectsX.maximumRelativeValue = offset
        motionEffectsX.minimumRelativeValue = -offset
        
        let motionEffectsY = UIInterpolatingMotionEffect(keyPath: "center.y", type: .TiltAlongVerticalAxis)
        motionEffectsY.maximumRelativeValue = offset
        motionEffectsY.minimumRelativeValue = -offset
        
        let group = UIMotionEffectGroup()
        group.motionEffects = [motionEffectsX, motionEffectsY]
        
        addMotionEffect(group)
    }
}
