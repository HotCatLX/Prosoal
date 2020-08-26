//
//  LabelExtension.swift
//  Swift假面舞会
//
//  Created by suckerl on 2019/12/10.
//  Copyright © 2019 suckerl. All rights reserved.
//

import UIKit




extension UILabel {
    
    /*
     * 便捷初始化方法
     * @param text : 文字内容
     */
    convenience init(text: String) {
        self.init()
        self.text = text
    }
    
    
    /*
     * 便捷初始化方法
     * @param text : 文字内容
     * @param color : 文字颜色,可为nil,为nil是位默认值
     * @param fontSize : 文字大小,可为nil,为nil是位默认值
     */
    public convenience init(text:String ,
                            color:UIColor? ,
                            fontSize: CGFloat?) {
        self.init(text: text)
        textColor = color ?? UIColor.black
        let fontNumber = fontSize ?? 16
        font = Font(fontNumber)
    }
    
    
    
    
    
}
