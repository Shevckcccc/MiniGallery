//
//  ViewController.swift
//  MiniGallery
//
//  Created by 805123890@qq.com on 04/18/2019.
//  Copyright (c) 2019 805123890@qq.com. All rights reserved.
//

import UIKit
import MiniGallery
import SnapKit

class ViewController: UIViewController {
    var gallery : Gallery!
    var dataArr = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gallery = Gallery()
        gallery.dataSource = self
        
        self.view.addSubview(gallery)
        gallery.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

extension ViewController : GalleryDataSource {
    
    func galleryNumberOfItems() -> Int {
        return 5
    }
    
    func gallery(modelForItemAt indexPath: IndexPath) -> GalleryModel? {
        return nil
    }
}

