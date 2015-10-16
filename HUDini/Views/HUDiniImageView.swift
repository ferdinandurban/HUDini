//
//  HUDiniImageView.swift
//  HUDini
//
//  Created by Ferdinand Urban on 15/10/15.
//  Copyright © 2015 Ferdinand Urban. All rights reserved.
//

import UIKit

public class HUDiniImageView: HUDiniBaseSquareView {

    public let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.alpha = 0.85
        imageView.clipsToBounds = true
        imageView.contentMode = .Center
        
        return imageView
    }()
    
    func imageViewInit(image: UIImage?) {
        imageView.image = image
        addSubview(imageView)
    }
    
    public init(image: UIImage?) {
        super.init()
        
        imageViewInit(image)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        imageViewInit(nil)
    }
}