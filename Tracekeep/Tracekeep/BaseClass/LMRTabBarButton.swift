//
//  LMRTabBarButton.swift
//  Tracekeep
//
//  Created by 卢梦如 on 2017/11/26.
//  Copyright © 2017年 Mengru Lu. All rights reserved.
//

import UIKit

class LMRTabBarButton: UIButton {

    override var isHighlighted: Bool{
        
        
        didSet{
            super.isHighlighted = false
        }
    }
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        titleLabel?.font = UIFont.systemFont(ofSize: 12)
        
        imageView?.contentMode = UIViewContentMode.scaleAspectFit
        titleLabel?.textAlignment = NSTextAlignment.center
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func imageRect(forContentRect contentRect: CGRect) -> CGRect {
        let newX:CGFloat = 0.0
        let newY:CGFloat = 5.0
        let newWidth:CGFloat = CGFloat(contentRect.size.width)
        let newHeight:CGFloat = CGFloat(contentRect.size.height) * 0.55 - newY
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }
    
    override func titleRect(forContentRect contentRect: CGRect) -> CGRect {
        let newX: CGFloat = 0
        let newY: CGFloat = contentRect.size.height*0.55
        let newWidth: CGFloat = contentRect.size.width
        let newHeight: CGFloat = contentRect.size.height-contentRect.size.height*0.55
        return CGRect(x: newX, y: newY, width: newWidth, height: newHeight)
    }

}
