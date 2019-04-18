//
//  VideoDefaultCell.swift
//  MiniGallery
//
//  Created by YuYongkai on 2019/4/18.
//

import UIKit

class VideoDefaultCell: UICollectionViewCell {
    
    var titleLabel:UILabel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func initView(){
        titleLabel = UILabel(frame: CGRect(x: 5, y: 5, width: 100, height: 50))
        contentView.layer.borderColor = UIColor.red.cgColor
        contentView.layer.borderWidth = 1
        addSubview(titleLabel!)
    }
}

