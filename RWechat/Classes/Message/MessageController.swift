//
//  MessageController.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/9/1.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit
import ObjectMapper

class MessageController: RTabelController {

    override func viewDidLoad() {
        super.viewDidLoad()
 
        fetchData()
    }
    
    func fetchData() {
        GET(url: "message", parameters: nil, useProtocol: true) { (responseData) in
            let resObj = responseData as! [[String: Any]]
            var list = [MessageModel]()
            for item in resObj {
                let model = Mapper<MessageModel>().map(JSON: item)
                list.append(model!)
            }
            
            Debug_print(msg: "\(String(describing: list))")
            
            if self.tableView.mj_header.isRefreshing() {
                self.tableView.mj_header.endRefreshing()
            } else if self.tableView.mj_footer.isRefreshing() {
                self.tableView.mj_footer.endRefreshing()
            }
        }
    }
    
    override func getFirst() {
        fetchData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
