//
//  HUDiniAnimation.swift
//  HUDini
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import Foundation

@objc protocol HUDiniAnimation {
    func startAnimation()
    optional func stopAnimation()
}
