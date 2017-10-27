//
//  RURLProtocol.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/25.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit

class RURLProtocol: URLProtocol, URLSessionDelegate, URLSessionDataDelegate {
    var dataTask : URLSessionDataTask?
    
    class func defaultSessionConfiguration() -> URLSessionConfiguration {
        let config: URLSessionConfiguration = URLSessionConfiguration.default
        config.protocolClasses = [RURLProtocol.self]
        return config
    }
    
    override class func canInit(with request: URLRequest) -> Bool {
        return false
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
        #if DEBUG
            request.url = URL.init(string: "https://api.seniverse.com/v3/weather/now.json?key=ge4l7elh3k0feaz3&location=zhengzhou&language=zh-Hans&unit=c")
        #endif
        
        if kDataMsg == 1 {
            let data = Data.message()
            let str = try? JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            client?.urlProtocol(self, didLoad: Data.message())
            client?.urlProtocolDidFinishLoading(self)
        } else {
            let session = URLSession.init(configuration: URLSessionConfiguration.default, delegate: self, delegateQueue: OperationQueue())
            dataTask = session.dataTask(with: request)
            dataTask?.resume()
        }
        
    }

    override func stopLoading() {
        dataTask?.resume()
    }
    
    //TODO: 网络代理中处理 数据
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive response: URLResponse, completionHandler: @escaping (URLSession.ResponseDisposition) -> Void) {
        completionHandler(.allow)
    }
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data) {
        client?.urlProtocol(self, didLoad: data)
    }
    /** 请求完成 */
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        client?.urlProtocolDidFinishLoading(self)
    }
    
}
