//
//  HUDiniBaseWideView.swift
//  HUDini
//
//  Created by Ferdinand Urban on 20/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

public class HUDiniBaseWideView: UIView {
    
    static let defaultBaseFrame = CGRect(origin: CGPointZero, size: CGSize(width: 300.0, height: 100.0))
    
    public init() {
        super.init(frame: HUDiniBaseWideView.defaultBaseFrame)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
