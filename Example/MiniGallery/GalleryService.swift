//
//  GalleryService.swift
//  MiniGallery_Example
//
//  Created by YuYongkai on 2019/4/19.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import UIKit
import Alamofire

class GalleryService: NSObject {
    
    func loadData(completion:  @escaping (Array<MiniModel>) -> Void) {
        let api = "http://private-04a55-videoplayer1.apiary-mock.com/pictures"
        
        Alamofire.request(api).responseJSON { (response) in
            guard let data = response.result.value as? [[String:Any]] else {
                print("Error:", response.result.error ?? "")
                return
            }
            let items = MiniModel.modelsFromJSONArray(data)
            completion(items)
        }
    }
}
