//
//  Extension+UIAlertController.swift
//  Tracekeep
//
//  Created by 卢梦如 on 2017/11/26.
//  Copyright © 2017年 Mengru Lu. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    class func createUIAlertController(title: String?, message: String?, leftButton: String, rightButton: String, complete: @escaping () -> Void) -> UIAlertController{
        
        let av = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: leftButton, style: .cancel, handler: nil)
        let confirm = UIAlertAction(title: rightButton, style: .destructive, handler: { (action) in
            
            complete()
            
        })
        
        av.addAction(cancel)
        av.addAction(confirm)
        
        return av
        
    }
    
    
    class func createUIAlertController(title: String?, message: String?, leftButton: String, rightButton: String, cancel: @escaping() -> Void, complete: @escaping () -> Void) -> UIAlertController{
        
        let av = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancel = UIAlertAction(title: leftButton, style: .cancel) { (action) in
            
            cancel()
            
        }
        
        let confirm = UIAlertAction(title: rightButton, style: .destructive, handler: { (action) in
            
            complete()
            
        })
        
        av.addAction(cancel)
        av.addAction(confirm)
        
        return av
        
    }
    
}



func LMRLog<T>(message : T, file : String = #file, lineNumber : Int = #line) {
    
    #if DEBUG
        
        let fileName = (file as NSString).lastPathComponent
        print("[\(fileName):line:\(lineNumber)]- \(message)")
        
    #endif
}

