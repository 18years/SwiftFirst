//
//  RTabBarController.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/9/1.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit

class RTabBarController: UITabBarController {
    
    var controlllers :[UIViewController]!
    /** 声明了数组类型，即使是空数组 ，normalImgs元素类型依旧是 UIImage */
    var normalImgs :[UIImage?]!
    var selectImgs :[UIImage?]!
    var titles = [String!]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        controlllers = [MessageController(),
                        ContactController(),
                        DicorverController(),
                        MeController()]
        normalImgs = [R.image.tabbar_mainframe(),
                      R.image.tabbar_contacts(),
                      R.image.tabbar_discover(),
                      R.image.tabbar_me()]
        selectImgs = [R.image.tabbar_mainframeHL(),
                      R.image.tabbar_contactsHL(),
                      R.image.tabbar_discoverHL(),
                      R.image.tabbar_meHL()]
        titles = ["消息", "联系人", "发现", "我的"]

        for index in 0 ..< controlllers.endIndex {
            addChildController(childVC: controlllers[index], normalImg: normalImgs[index]!, selectImg: selectImgs[index]!, title: titles[index])
        }
    }
    
    func addChildController(childVC: UIViewController, normalImg: UIImage, selectImg: UIImage, title: String) {
        childVC.title = title
        childVC.tabBarItem = UITabBarItem.init(title: title, image: normalImg.withRenderingMode(.alwaysOriginal), selectedImage: selectImg.withRenderingMode(.alwaysOriginal))
        childVC.tabBarItem.setTitleTextAttributes([NSForegroundColorAttributeName: UIColor.cyan], for: .selected)
        addChildViewController(RNavgationController.init(rootViewController: childVC))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


}

extension RTabBarController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}

