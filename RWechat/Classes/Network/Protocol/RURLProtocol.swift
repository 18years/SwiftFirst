//
//  RURLProtocol.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/25.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit

class RURLProtocol: URLProtocol {
    
    class func defaultSessionConfiguration() -> URLSessionConfiguration {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        config.protocolClasses = [RURLProtocol.self]
        return config
    }

    override class func canInit(with request: URLRequest) -> Bool {
        guard let msg = RURLProtocol.property(forKey: "RNetwork", in: request) else {
            return false
        }
        return true
    }
    
    override class func canInit(with task: URLSessionTask) -> Bool {
        
        let httpHeaders = task.currentRequest?.allHTTPHeaderFields
        if (httpHeaders?.keys.contains("RNetwork"))! {
            return true
        }
        return  false
    }

}
