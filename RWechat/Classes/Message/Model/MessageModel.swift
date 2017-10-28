//
//  MessageModel.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/28.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit
import ObjectMapper

class MessageModel: NSObject, Mappable {
    var message_unread_num: Int?
    var userid: String?
    var meesage_from_type: String?
    var avatar_url: String?
    var nickname: String?
    
    /** last_message */
    
    var message_id: String?
    var receive_userid: String?
    var send_userid: String?
    var ctime: String?
    //时间戳
    var timestamp: Int64?
    var message_content_type: String?
    var client_message_id: String?
    var message: String?
    var device: String?
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        message_unread_num <- map["message_unread_num"]
        userid <- map["userid"]
        meesage_from_type <- map["meesage_from_type"]
        avatar_url <- map["avatar_url"]
        nickname <- map["nickname"]
        
        message_id <- map["last_message.message_id"]
        receive_userid <- map["last_message.receive_userid"]
        send_userid <- map["last_message.send_userid"]
        ctime <- map["last_message.ctime"]
        timestamp <- map["last_message.timestamp"]
        
        message_content_type <- map["last_message.message_content_type"]
        client_message_id <- map["last_message.client_message_id"]
        message <- map["last_message.message"]
        device <- map["last_message.device"]
    }


}

