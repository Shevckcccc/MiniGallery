//
//  Gallery.swift
//  MiniGallery
//
//  Created by YuYongkai on 2019/4/18.
//

import UIKit
import SnapKit

public class Gallery: UIView {
    
    var videoGallery: VideoGallery!
    var imageGallery: ImageGallery!
    public var dataSource: GalleryDataSource?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews();
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        videoGallery = VideoGallery()
        imageGallery = ImageGallery()
        
        addSubview(videoGallery)
        addSubview(imageGallery)
        
        videoGallery.snp.makeConstraints { (make) in
            make.left.right.top.equalToSuperview()
            make.height.equalToSuperview().dividedBy(2)
        }
        
        imageGallery.snp.makeConstraints { (make) in
            make.top.equalTo(videoGallery.snp_bottom).offset(6)
            make.left.right.bottom.equalToSuperview()
        }
        
        videoGallery.delegate = self
        videoGallery.dataSource = self
        
        imageGallery.delegate = self
        imageGallery.dataSource = self
        
    }
}

extension Gallery {
    public func reloadData() {
        imageGallery.reloadData()
        videoGallery.reloadData()
    }
}

extension Gallery : VideoGalleryDelegate, ImageGalleryDelegate, GalleryDataSource {
    
    func videoGallery(_ videoGallery: VideoGallery, didScrollTo indexPath: IndexPath) {
        imageGallery.scrollToCell(at: indexPath)
    }
    
    func imageGallery(_ imageGallery: ImageGallery, didScrollTo indexPath: IndexPath) {
        videoGallery.scrollToCell(at: indexPath)
    }
    
    public func galleryNumberOfItems() -> Int {
        return dataSource?.galleryNumberOfItems() ?? 0
    }
    
    public func gallery(modelForItemAt indexPath: IndexPath) -> GalleryModel? {
        return dataSource?.gallery(modelForItemAt: indexPath)
    }
}

