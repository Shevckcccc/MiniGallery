//
//  GalleryProtocol.swift
//  MiniGallery
//
//  Created by YuYongkai on 2019/4/18.
//

import UIKit

public protocol GalleryDataSource: class {
    
    func galleryNumberOfItems() -> Int
    
    func gallery(modelForItemAt indexPath: IndexPath) -> GalleryModel?
    
    // TODO: 未实现，先用default cell
    func gallery(cellForVideoItemAt indexPath: IndexPath) -> UICollectionViewCell?
    
    // TODO: 未实现，先用default cell
    func gallery(cellForImageItemAt indexPath: IndexPath) -> UICollectionViewCell?
}

extension GalleryDataSource {
    public func gallery(cellForVideoItemAt indexPath: IndexPath) -> UICollectionViewCell? {
        return nil
    }
    
    public func gallery(cellForImageItemAt indexPath: IndexPath) -> UICollectionViewCell? {
        return nil
    }
}

public protocol GalleryModel: class {
    
    var videoUrl : String? { get set }
    
    var imageUrl : String? { get set }
    
    var title : String? { get set }
}

