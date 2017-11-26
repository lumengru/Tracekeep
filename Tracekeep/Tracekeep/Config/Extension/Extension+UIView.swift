//
//  Extension+UIView.swift
//  Tracekeep
//
//  Created by 卢梦如 on 2017/11/26.
//  Copyright © 2017年 Mengru Lu. All rights reserved.
//

import UIKit

extension UIView {
    
    // 获取view左边的坐标
    var minX: CGFloat {
        
        return self.frame.origin.x
        
    }
    
    // 获取view右边的坐标
    var maxX: CGFloat {
        
        return self.frame.origin.x + self.frame.size.width
        
    }
    
    // 获取view上边的坐标
    var minY: CGFloat {
        
        return self.frame.origin.y
        
    }
    
    // 获取view下边的坐标
    var maxY: CGFloat {
        
        return self.frame.origin.y + self.frame.size.height
        
    }
    
    // 获取view的x轴的中心点
    var centerX: CGFloat {
        
        return self.center.x
        
    }
    
    // 获取view的y轴的中心点
    var centerY: CGFloat {
        
        return self.center.y
        
    }
    
    // 获取view的宽度
    var width: CGFloat {
        
        return self.frame.size.width
        
    }
    
    // 获取view的高度
    var height: CGFloat {
        
        return self.frame.size.height
        
    }
    
    // 获取view的size
    var size: CGSize {
        
        return self.frame.size
        
    }
    
}
