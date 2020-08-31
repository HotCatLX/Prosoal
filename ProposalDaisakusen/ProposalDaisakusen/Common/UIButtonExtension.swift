//
//  UIButtonExtension.swift
//
//  Created by suckerl on 2019/12/10.
//  Copyright © 2019 suckerl. All rights reserved.
//

import UIKit


extension UIButton {
    
    /*
     *
     * 边界初始化button
     * @param title: 字体n内容
     * @param textColor: 字体颜色,不设置默认为黑色
     * @param backColor: 背景颜色,不设置默认为白色
     * @param fontSize: 字体大小
     * @param corner: 圆角,如果设置为0,即为没有圆角
     *
     */
    
    convenience init(title: String,
                     textColor: UIColor?,
                     backColor: UIColor?,
                     fontSize: CGFloat,
                     corner: CGFloat
    )  {
        self.init()
        setTitle(title, for: .normal)
        setTitleColor(textColor ?? UIColor.black, for: .normal)
        backgroundColor = backColor
        titleLabel?.font = Font(fontSize)
        if corner > 0 {
            layer.cornerRadius = corner
        }
    }
    
    
    
}
