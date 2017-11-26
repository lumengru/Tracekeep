//
//  Extension+UILabel.swift
//  Tracekeep
//
//  Created by 卢梦如 on 2017/11/26.
//  Copyright © 2017年 Mengru Lu. All rights reserved.
//

import UIKit

extension UILabel {
    
    // 工厂模式
    func setAttribute(font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment, backgroundColor: UIColor?) {
        
        if backgroundColor != nil {
            
            self.backgroundColor = backgroundColor
            
        }
        
        self.font = font
        self.textColor = textColor
        self.textAlignment = textAlignment
        
    }
    
    // 修改UILabel的行间距
    func changeTheLineSpacing(distance: CGFloat) {
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: self.text!)
        let paragraphStyle: NSMutableParagraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = distance       // 调整行间距
        attributedString.addAttribute(NSAttributedStringKey.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, (self.text! as NSString).length))
        self.attributedText = attributedString;
        
    }
    
    // 设置修改UILabel的行间距之后的frame
    func changeTheFrame (font: CGFloat, distance: CGFloat) {
        
        var newHeight: CGFloat = 0
        newHeight = (self.text?.getTextHeight(font: font, width: self.width))!
        newHeight += newHeight / font * distance + font
        self.frame = CGRect(x: self.frame.minX, y: self.frame.minY, width: self.frame.width, height: newHeight)
        
    }
    
    // 修改字体颜色
    func changeTheTextColor(textColor: UIColor, textFont: CGFloat, range: NSRange) {
        
        let attributedString: NSMutableAttributedString = NSMutableAttributedString(string: self.text!)
        let attris: [NSAttributedStringKey: Any] = [
    
               NSAttributedStringKey.foregroundColor: textColor,
               NSAttributedStringKey.font: UIFont.systemFont(ofSize: textFont),
               NSAttributedStringKey.backgroundColor: self.backgroundColor!
            
        ]
        
        attributedString.addAttributes(attris, range: range)
        self.attributedText = attributedString;
        
    }
    
    
}



