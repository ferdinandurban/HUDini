//
//  HUDini.swift
//  HUDini
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit


public class HUDini: NSObject {
    
    // Properties
    public class var sharedInstance: HUDini {
        struct Singleton {
            static var onceToken: dispatch_once_t = 0
            static var instance: HUDini? = nil
        }
        dispatch_once(&Singleton.onceToken) {
            Singleton.instance = HUDini()
        }
        return Singleton.instance!
    }
    
    private let window = HUDiniWindow()
    
    public var dimsBackground = true
    public var userInteractionOnUnderlyingViewsEnabled: Bool {
        get {
            return !window.userInteractionEnabled
        }
        set {
            window.userInteractionEnabled = !newValue
        }
    }
    
    public var isVisible: Bool {
        return !window.hidden
    }
    
    public var contentView: UIView {
        get {
            return window.frameView.content
        }
        set {
            window.frameView.content = newValue
            animationStart()
        }
    }
    
    // MARK: - Initialization
    public override init() {
        super.init()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "willEndterForeground", name: UIApplicationWillEnterForegroundNotification, object: nil)
        
        userInteractionOnUnderlyingViewsEnabled = false
    }
    
    public func show() {
        window.showFrameView()
        if dimsBackground {
            window.showBackground(animated: true)
        }
        
        animationStart()
    }

    // MARK: Hide methods
    private var hideTimer: NSTimer?
    public func hide(afterDelay delay: NSTimeInterval) {
        hideTimer?.invalidate()
        hideTimer = NSTimer.scheduledTimerWithTimeInterval(delay, target: self, selector: Selector("animatedHide"), userInfo: nil, repeats: false)
    }
    
    public func animatedHide() {
        window.hideFrameView(animated: true)
        
        if dimsBackground {
            window.hideBackground(animated: true)
        }
        
        animationStop()
    }
    
    // MARK: Animation
    internal func animationStart() {
        let animatingContentView = contentView as! HUDiniAnimation
        animatingContentView.startAnimation()
    }
    
    internal func animationStop() {
        let animatingContentView = contentView as! HUDiniAnimation
        animatingContentView.stopAnimation!()
    }

    
}