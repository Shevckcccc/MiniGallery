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
    var activityIndicator: UIActivityIndicatorView!
    var data = Array<GalleryModel>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        loadData()
    }
    
    func setupViews() {
        gallery = Gallery()
        gallery.dataSource = self
        
        self.view.addSubview(gallery)
        gallery.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.left.right.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        self.view.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { (make) in
            make.center.equalToSuperview()
        }
        activityIndicator.startAnimating()
    }
    
    func loadData() {
        GalleryService().loadData { items in
            self.data = items;
            self.gallery.reloadData()
            self.activityIndicator.stopAnimating();
        }
    }
}

extension ViewController : GalleryDataSource {
    
    func galleryNumberOfItems() -> Int {
        return data.count
    }
    
    func gallery(modelForItemAt indexPath: IndexPath) -> GalleryModel? {
        return data[indexPath.row]
    }
}

