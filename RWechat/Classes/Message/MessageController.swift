//
//  MessageController.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/9/1.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit

class MessageController: RTabelController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        if #available(iOS 11.0, *) {
            Debug_print(msg: "ios 11")
            tableView.contentInsetAdjustmentBehavior = .automatic
        } else {
            Debug_print(msg: "ios 11 之前")
            self.automaticallyAdjustsScrollViewInsets = false
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension MessageController {
    override func registerCell(responstBlk: @escaping (AnyClass?, String) -> Void) {
        responstBlk(MessageBaseCell.self, "MessageBaseCell")
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MessageBaseCell")
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return kAppHeight(height: 60)
    }
}
