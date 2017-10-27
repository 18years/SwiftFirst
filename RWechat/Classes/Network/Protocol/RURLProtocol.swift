//
//  RURLProtocol.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/25.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit

class RURLProtocol: URLProtocol, URLSessionDataDelegate,URLSessionTaskDelegate,URLSessionDelegate {
    var session : URLSessionDataTask?
    class func defaultSessionConfiguration() -> URLSessionConfiguration {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        config.protocolClasses = [RURLProtocol.self]
        return config
    }
    
    /** 是否需要拦截 */
    override class func canInit(with task: URLSessionTask) -> Bool {
        
        let httpHeaders = task.currentRequest?.allHTTPHeaderFields
        if (httpHeaders?.keys.contains("RNetwork"))! {
            return true
        }
        return  false
    }
    /** 在此处可以实现对 request的修改 */
    override class func canonicalRequest(for request: URLRequest) -> URLRequest {
        return request
    }
    /** 主要判断两个request是否相同，如果相同的话可以使用缓存数据，通常只需要调用父类的实现 */
    override class func requestIsCacheEquivalent(_ a: URLRequest, to b: URLRequest) -> Bool {
        return super.requestIsCacheEquivalent(a, to: b)
    }
    
    override func startLoading() {
        var httpHeaders = self.request.allHTTPHeaderFields
        if (httpHeaders?.keys.contains("RNetwork"))! {
            httpHeaders = self.request.allHTTPHeaderFields
            httpHeaders?.removeValue(forKey: "RNetwork")
        }
        var request = URLRequest.init(url: self.request.url!)
        request.allHTTPHeaderFields = httpHeaders
        
        session = URLSession.shared.dataTask(with: request)
        session!.resume()
    }

    override func stopLoading() {
        session?.cancel()
    }
    
    //TODO: 网络代理中处理 数据
    
}
