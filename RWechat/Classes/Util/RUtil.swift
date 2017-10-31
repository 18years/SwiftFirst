//
//  RUtil.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/9.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

//MARK: URL

let kBaseUrl: String = "http://www.baidu.com/"

//MARK: 其它
let kSystemVersion: CGFloat = CGFloat(Float(UIDevice.current.systemVersion)!)

//MARK: 色彩
let kBaseBackgroundColor : UIColor = UIColor.init(hex6: 0xf1f1f1)
let kNavBarColor : UIColor = UIColor.init(hex6: 0x289bef)

//MARK: 长度
let kWindow: UIWindow = UIApplication.shared.keyWindow!
let kScreenW: CGFloat = UIScreen.main.bounds.size.width
let kScreenH: CGFloat = UIScreen.main.bounds.size.height
/** 相对长度以 IPhone6 为基准 */
let kAppScaleW: CGFloat = kScreenW / 375.0
let kAppScaleH: CGFloat = kScreenH / 667.0

public func kAppWidth(width: CGFloat) -> CGFloat {
    return width * kAppScaleW
}

public func kAppHeight(height: CGFloat) -> CGFloat {
    return height * kAppScaleH
}

public func kAppScaleFont(size: CGFloat) -> UIFont {
    return UIFont.systemFont(ofSize: size * kAppScaleW)
}

let kButtonH = 45.0

public func kTabBarHeight(vc: UIViewController) -> CGFloat {
    return (vc.tabBarController?.tabBar.bounds.size.height)!
}
public func kBottomCornerH() -> CGFloat {
    if kIsIphoneX {
        return 34
    }
    return 0
}
let kIsIphoneX:Bool = (kScreenH==812.0)

//MARK: 调试信息
public func Debug_print(msg: String) {
    #if DEBUG
        print(msg)
    #else
    #endif
}
