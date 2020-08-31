//
//  ToastView.swift
//
//  Created by suckerl on 2019/12/23.
//  Copyright © 2019 suckerl. All rights reserved.
//

import UIKit


/*
 *
 * 公用toast 组件
 *
 */

class ToastView: UIView {
    
    fileprivate lazy var toastLabel: UILabel = {
        let toast = UILabel()
        toast.font = UIFont(name: "Zapfino", size: 15)
        toast.textColor = ColorText_Toast
        toast.backgroundColor = ColorBG_Toast
        toast.numberOfLines = 0;
        toast.layer.cornerRadius = 12
        toast.layer.masksToBounds = true
        toast.textAlignment = .center
        toast.layer.shadowOffset = CGSize(width: 0.2, height: 5)
        return toast
    }()
    
    
    private static let sharedToast: ToastView = {
        let toast = ToastView()
        toast.frame = UIScreen.main.bounds
        return toast
    }()

    

    class func shared() -> ToastView {
        return sharedToast
    }


    public func show(str: String) {

        ToastView.shared().addSubview(toastLabel)
        ToastView.shared().toastLabel.text = str
        
        let rect: CGRect = str.boundingRect(with: CGSize(width:ScreenWidth , height: ScreenHeight), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)], context: nil)
        var toastWidth: CGFloat = rect.width
        var toastHeight: CGFloat = rect.height
        
        //default value
        if toastHeight < Height(150) { toastHeight = Height(150) }
        if toastWidth < Width(170) { toastWidth = Width(170) }

        ToastView.shared().toastLabel.frame = CGRect(x: (ScreenWidth - toastWidth)/2, y: (ScreenHeight-toastHeight)/2, width: toastWidth, height: toastHeight)
        
        UIApplication.shared.keyWindow?.addSubview(ToastView.shared())
        ToastView.shared().perform(#selector(removeFromSuperview), with: nil, afterDelay: 1.5)
    }

}
