//
//  Data.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/27.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit

let kDataMsg = 1

extension Data {
   static func message() -> Data {
    let path = Bundle.main.path(forResource: "message", ofType: "json")
    Debug_print(msg: "message path is \(path)")
    return try! Data.init(contentsOf: URL.init(string: path!)!, options: Data.ReadingOptions.mappedIfSafe)
    
    }
}
