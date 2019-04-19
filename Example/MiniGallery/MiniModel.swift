//
//  MiniModel.swift
//  MiniGallery_Example
//
//  Created by YuYongkai on 2019/4/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import MiniGallery

class MiniModel: GalleryModel {
    
    var videoUrl: String?
    
    var imageUrl: String?
    
    var title: String?
    
    var id: Int?
    
    init(id: Int, videoUrl: String, imageUrl: String) {
        self.videoUrl = videoUrl
        self.imageUrl = imageUrl
        self.id = id
    }
    
    static func modelsFromJSONArray(_ jsonArray : [[String:Any]]) -> Array<MiniModel> {
        return jsonArray.map { item -> MiniModel in
            return MiniModel(id: item["id"] as! Int, videoUrl: item["videoUrl"] as! String, imageUrl: item["imageUrl"] as! String)
        }
    }
}
