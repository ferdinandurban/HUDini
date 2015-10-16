//
//  HUDiniWindowRootViewController.swift
//  HUDini
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

internal class HUDiniWindowRootViewController: UIViewController {
    internal override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.supportedInterfaceOrientations()
        } else {
            return UIInterfaceOrientationMask.Portrait
        }
    }
    
    internal override func preferredStatusBarStyle() -> UIStatusBarStyle {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.preferredStatusBarStyle()
        } else {
            return .Default
        }
    }
    
    internal override func prefersStatusBarHidden() -> Bool {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.prefersStatusBarHidden()
        } else {
            return false
        }
    }
    
    internal override func preferredStatusBarUpdateAnimation() -> UIStatusBarAnimation {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.preferredStatusBarUpdateAnimation()
        } else {
            return .None
        }
    }
    
    internal override func shouldAutorotate() -> Bool {
        if let rootViewController = UIApplication.sharedApplication().delegate?.window??.rootViewController {
            return rootViewController.shouldAutorotate()
        } else {
            return false
        }
    }

}