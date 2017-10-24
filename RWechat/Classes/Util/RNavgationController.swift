//
//  RNavgationController.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/9/1.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit

class RNavgationController: UINavigationController {

    
    override func viewWillAppear(_ animated: Bool) {
        navigationBar.isTranslucent = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = self.childViewControllers.count != 0
        
        super.pushViewController(viewController, animated: animated)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
