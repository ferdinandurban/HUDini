//
//  ViewController.swift
//  HUDiniDemo
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit
import HUDini

class ViewController: UIViewController {


    @IBAction func onTestBtnClick(sender: AnyObject) {
        
        HUDini.sharedInstance.contentView = HUDiniSuccess()
        HUDini.sharedInstance.show()
        HUDini.sharedInstance.hide(afterDelay: 2.0);
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        HUDini.sharedInstance.dimsBackground = true
        HUDini.sharedInstance.userInteractionOnUnderlyingViewsEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func supportedInterfaceOrientations() -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.AllButUpsideDown;
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}

