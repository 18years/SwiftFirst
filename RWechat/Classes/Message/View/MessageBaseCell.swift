//
//  MessageBaseCell.swift
//  RWechat
//
//  Created by 谢江涛 on 2017/10/19.
//  Copyright © 2017年 谢江涛. All rights reserved.
//

import UIKit

class MessageBaseCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        selectionStyle = .none
    }
    
    func setupUI() {
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(timeLabel)
        contentView.addSubview(msgLabel)
        #if DEBUG
            imageView.layer.borderColor = UIColor.cyan.cgColor
            imageView.layer.borderWidth = 1.0
            nameLabel.layer.borderColor = UIColor.cyan.cgColor
            nameLabel.layer.borderWidth = 1.0
            timeLabel.layer.borderColor = UIColor.cyan.cgColor
            timeLabel.layer.borderWidth = 1.0
        #endif
        
        imageView.snp.makeConstraints { (make) in
            make.left.equalTo(self.separatorInset.left)
            make.centerY.equalTo(self.contentView)
            make.size.equalTo(CGSize.init(width: kAppWidth(width: 40), height: kAppHeight(height: 40)))
        }
        nameLabel.snp.makeConstraints { (make) in
            make.left.equalTo(self.imageView.snp.right).offset(kAppWidth(width: 6))
            make.top.equalTo(self.contentView).offset(kAppHeight(height: 2.0))
            make.bottom.equalTo(self.contentView.snp.centerY).offset(kAppHeight(height: -2.0))
            make.right.equalTo(self.timeLabel.snp.left).offset(kAppWidth(width: -6))
        }
        timeLabel.snp.makeConstraints { (make) in
            make.top.bottom.equalTo(self.nameLabel)
            make.right.equalTo(self.contentView.snp.right).offset(kAppWidth(width: -6))
            make.width.equalTo(kAppWidth(width: 55))
        }
        msgLabel.snp.makeConstraints { (make) in
            
        }
    }
    
    //MARK:懒加载
    override lazy var imageView: UIImageView = {
       let headImg = UIImageView.init()
        headImg.layer.cornerRadius = 2.0
        return headImg
    }()
    
    lazy var nameLabel: UILabel = {
       let nameLabel = UILabel()
        return nameLabel
    }()
    
    lazy var timeLabel: UILabel = {
        let timeLabel = UILabel()
        return timeLabel
    }()
    
    lazy var msgLabel: UILabel = {
        let msgLabel = UILabel()
        return msgLabel
    }()
}
