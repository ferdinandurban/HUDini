//
//  HUDiniTextView.swift
//  HUDini
//
//  Created by Ferdinand Urban on 20/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

public class HUDiniTextView: HUDiniBaseWideView {
    
    public let titleLabel: UILabel = {
        let label = UILabel()
        
        label.textAlignment = .Center
        label.font = UIFont.boldSystemFontOfSize(17.0)
        label.textColor = UIColor.blackColor().colorWithAlphaComponent(0.85)
        label.adjustsFontSizeToFitWidth = true
        label.numberOfLines = 3
        
        return label
        }()
    
    public init(text: String?) {
        super.init()
        titleLabelInit(text)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        titleLabelInit("")
    }
    
    func titleLabelInit(text: String?) {
        titleLabel.text = text
        addSubview(titleLabel)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        let padding: CGFloat = 10.0
        titleLabel.frame = CGRectInset(bounds, padding, padding)
    }
    
    
}

