//
//  ImageDefaultCell.swift
//  MiniGallery
//
//  Created by YuYongkai on 2019/4/18.
//

import UIKit
import SnapKit

class ImageDefaultCell: UICollectionViewCell {
    
    var imageView: UIImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews(){
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.backgroundColor = UIColor.gray
        imageView.layer.borderWidth = 1
        imageView.layer.borderColor = UIColor.gray.cgColor
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
            make.height.equalToSuperview().dividedBy(1.3)
            make.width.equalToSuperview().dividedBy(1.3)
        }
    }
}
