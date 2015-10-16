//
//  HUDiniBaseSquareView.swift
//  HUDini
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

public class HUDiniBaseSquareView: UIView {

    static let defaultBaseFrame = CGRect(origin: CGPointZero, size: CGSize(width: 150.0, height: 150.0))
    
    public init() {
        super.init(frame: HUDiniBaseSquareView.defaultBaseFrame)
    }
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
