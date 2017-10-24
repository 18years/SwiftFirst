//
//  RTabelController.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/9.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit
import MJRefresh
import SnapKit

@objc protocol RTableProtocol :NSObjectProtocol {
    //MARK: registerCell 是必须实现的，虽然被定义成了 optional
    @objc optional func registerCell(responstBlk: @escaping (_ cellCls: Swift.AnyClass?, _ reuseId: String) -> Void)
    
    @objc optional func getFirst()
    @objc optional func getNext()
    
}

class RTabelController: RBaseController, UITableViewDelegate, UITableViewDataSource, RTableProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
        }
        
        if true == responds(to: #selector(RTabelController.registerCell(responstBlk:))) {
            registerCell(responstBlk: { (cellCls, reuseId) in
                self.tableView.register(cellCls, forCellReuseIdentifier: reuseId)
                self.tableView.delegate = self
                self.tableView.dataSource = self
            })
        }
    }
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        
        if #available(iOS 11.0, *) {
            tableView.contentInsetAdjustmentBehavior = .never
        } else {
            self.automaticallyAdjustsScrollViewInsets = false
        }
        
        tableView.mj_header = MJRefreshNormalHeader.init(refreshingBlock: {
            self.getFirst()
        })
        tableView.mj_footer = MJRefreshAutoNormalFooter.init(refreshingBlock: {
            self.getNext()
        })
        
        return tableView
    }()
    
}

extension RTabelController {
    func registerCell(responstBlk: @escaping (Swift.AnyClass?, String) -> Void) {
        responstBlk(UITableViewCell.self, "UITableViewCell")
    }
    
    func getFirst() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            self.tableView.mj_header.endRefreshing()
        }
    }
    
    func getNext() {
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            self.tableView.mj_footer.endRefreshing()
        }
    }
}

extension RTabelController {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
