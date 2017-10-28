//
//  BaseModel.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/28.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit
import ObjectMapper

class BaseModel: NSObject,ObjectMapper.Mappable {
    var code: Int?
    var message: String?
    var data: AnyObject?
    
    required init?(map: Map) {
        
    }
    
   func mapping(map: Map) {
        code <- map["code"]
        message <- map["message"]
        data <- map["data"]
    }
}
