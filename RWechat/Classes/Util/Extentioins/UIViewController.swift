//
//  UIViewController.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/9/6.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit
import Alamofire
import MBProgressHUD

extension UIViewController  {
    func GET(url: String, parameters: Parameters?, useProtocol: Bool, responstBlk : @escaping (Any?)->Void) {
        
        let hud = MBProgressHUD.init(frame: UIScreen.main.bounds)
        hud.show(animated: true)
        hud.removeFromSuperViewOnHide = true
        hud.backgroundColor = UIColor.lightGray
        hud.alpha = 0.5
        hud.label.text = "...."
        kWindow.addSubview(hud)
        
        RNetwork.GET(url: url, parameters: parameters, useProtocol: useProtocol) { (responseObj) in
            let resObj = responseObj as! BaseModel
            
            if 0 == resObj.code {
                hud.hide(animated: true, afterDelay: 0.5)
            } else {
                hud.label.text = resObj.message
                hud.hide(animated: true, afterDelay: 1)
            }
            responstBlk(resObj.data)
        }
    }
    
}
