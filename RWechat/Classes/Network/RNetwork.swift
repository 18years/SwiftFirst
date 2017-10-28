//
//  RNetwork.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/25.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import ObjectMapper

class RSessionManager: Alamofire.SessionManager {
    
    public static let sharedSessionManager: SessionManager = {
        let configuration = RURLProtocol.defaultSessionConfiguration()
        let sessionManager = SessionManager(configuration: configuration)
        return sessionManager
    } ()
}

class RNetwork: NSObject {
    
    public static let sharedInstance = RSessionManager.sharedSessionManager
    
}

extension RNetwork {
    
    class func GET(url: String, parameters: Parameters?, responstBlk : @escaping (Any?)->Void) {
        GET(url: url, parameters: parameters, useProtocol: false, responstBlk: responstBlk)
    }
    
    class func GET(url: String, parameters: Parameters?, useProtocol: Bool, responstBlk : @escaping (Any?)->Void)  {
    
        /** 这个的意义也只是 可以在 Protocol 中区分 request是否需要被拦截 */
        var headers: [String: String]? = SessionManager.defaultHTTPHeaders
        if useProtocol {
            headers!["RNetwork"] = "1"
        }
        
        RNetwork.sharedInstance.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: headers) .responseJSON { (responseData) in
            let resData = JSON.init(data: responseData.data!, options: JSONSerialization.ReadingOptions.mutableLeaves, error: nil).dictionaryObject
            let obj = ObjectMapper.Mapper<BaseModel>().map(JSON: resData!)
            responstBlk(obj)
        }
    }
    
}
