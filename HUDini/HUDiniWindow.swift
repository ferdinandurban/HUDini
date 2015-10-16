//
//  HUDiniWindow.swift
//  HUDini
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

internal class HUDiniWindow: UIWindow {
    
    internal let frameView: HUDiniFrameView
    private var willHide = false
    private let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white:0.0, alpha:0.25)
        view.alpha = 0.0;
        return view;
        }()

    internal init(frameView: HUDiniFrameView = HUDiniFrameView()) {
        self.frameView = frameView
        super.init(frame: UIApplication.sharedApplication().delegate!.window!!.bounds)
        windowInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        frameView = HUDiniFrameView()
        
        super.init(coder: aDecoder)
        windowInit()
    }
    
    private func windowInit() {
        rootViewController = HUDiniWindowRootViewController()
        windowLevel = UIWindowLevelNormal + 1.0
        backgroundColor = UIColor.clearColor()
        
        addSubview(backgroundView)
        addSubview(frameView)
    }
    
    internal override func layoutSubviews() {
        super.layoutSubviews()
        
        frameView.center = center
        backgroundView.frame = bounds
    }
    
    internal func showFrameView() {
        layer.removeAllAnimations()
        makeKeyAndVisible()
        frameView.center = center
        frameView.alpha = 1.0
        hidden = false
    }
    
    internal func hideFrameView(animated anim: Bool) {
        let completion: (finished: Bool) -> (Void) = { finished in
            if finished {
                self.hidden = true
                self.resignKeyWindow()
            }
            
            self.willHide = false
        }
        
        if hidden {
            return
        }
        
        willHide = true
        
        if anim {
            UIView.animateWithDuration(0.8, animations: { self.frameView.alpha = 0.0 }, completion: completion)
        } else {
            completion(finished: true)
        }
    }
    
    // MARK: - Background
    internal func showBackground(animated anim: Bool) {
        if anim {
            UIView.animateWithDuration(0.175) {
                self.backgroundView.alpha = 1.0
            }
        } else {
            backgroundView.alpha = 1.0;
        }
    }
    
    internal func hideBackground(animated anim: Bool) {
        if anim {
            UIView.animateWithDuration(0.65) {
                self.backgroundView.alpha = 0.0
            }
        } else {
            backgroundView.alpha = 0.0;
        }
    }
}
