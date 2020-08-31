//
//  CommonInterface.swift
//  ProposalDaisakusen
//
//  Created by suckerl on 2020/8/26.
//  Copyright © 2020 suckerl. All rights reserved.
//

import UIKit



// MARK: - Screen
let ScreenWidth: CGFloat = UIScreen.main.bounds.size.width
let ScreenHeight: CGFloat = UIScreen.main.bounds.size.height


// MARK: - 适配

/*
 * 宽度和高度适配
 */
//高度适配
//UI切图错误,导出的尺寸图为 562.5 * 1218
//可以更换为 375 * 667 的适配
public func Height( _ origin : CGFloat) -> CGFloat {
    let fitHeight: CGFloat = (origin / 1218.0) * UIScreen.main.bounds.size.height
    return fitHeight
}
//宽度适配
public func Width( _ origin: CGFloat) -> CGFloat {
    let fitWidth: CGFloat = (origin / 562.5) * UIScreen.main.bounds.size.width
    return fitWidth
}

/*
 * 字体适配
 * 本质是根据宽度适配
*/
public func Font( _ origin : CGFloat) -> UIFont {
    let font: UIFont = UIFont.systemFont(ofSize: Width(origin))
    return font
}

