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
public func Height( _ origin : CGFloat) -> CGFloat {
    let fitHeight: CGFloat = (origin / 667.000) * UIScreen.main.bounds.size.height
    return fitHeight
}
//宽度适配
public func Width( _ origin: CGFloat) -> CGFloat {
    let fitWidth: CGFloat = (origin / 375.000) * UIScreen.main.bounds.size.width
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

