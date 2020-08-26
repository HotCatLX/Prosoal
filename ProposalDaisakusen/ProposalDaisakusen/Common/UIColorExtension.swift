//
//  UIColorExtension.swift
//  Swift假面舞会
//
//  Created by suckerl on 2019/12/10.
//  Copyright © 2019 suckerl. All rights reserved.
//

import UIKit


extension UIColor {
    
     /*
      * 便捷初始化方法
      * @param hex : 例如888888
      */
    convenience init(hex: UInt32) {
        let r: CGFloat = CGFloat((hex & 0xFF000000) >> 24) / 255.0
        let g: CGFloat = CGFloat((hex & 0x00FF0000) >> 16) / 255.0
        let b: CGFloat = CGFloat((hex & 0x0000FF00) >> 8) / 255.0
        let a: CGFloat = CGFloat(hex & 0x000000FF) / 255.0
        self.init(red: r, green: g, blue: b, alpha: a)
    }
    
    /*
     * 便捷初始化方法
     * @param hex : 例如"#5943FC" or "5943FC"
     */
    convenience init(hexStr: String) {
        var convertString:String = hexStr.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        if (convertString.hasPrefix("#")) {
            convertString.remove(at: convertString.startIndex)
        }
           
        if ((convertString.count) != 6) {
            self.init()
        } else {
            var rgbValue:UInt64 = 0
            Scanner(string: convertString).scanHexInt64(&rgbValue)
            self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
                      green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
                      blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
                      alpha: 1)
           }
        
        
        
    }
    
    
    
    
    
}
