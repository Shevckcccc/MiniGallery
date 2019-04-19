//
//  ImageGallery.swift
//  MiniGallery
//
//  Created by YuYongkai on 2019/4/18.
//

import UIKit
import SDWebImage

protocol ImageGalleryDelegate: class {
    func imageGallery(_ imageGallery: ImageGallery, didScrollTo indexPath: IndexPath)
}

class ImageGallery: UIView {
    
    var collectionView : UICollectionView!
    var flowLayout : UICollectionViewFlowLayout!
    var delegate: ImageGalleryDelegate?
    var dataSource: GalleryDataSource?
    let minimumLineSpacing : CGFloat = 40
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews();
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        flowLayout = HorizontalFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = minimumLineSpacing
        
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout);
        collectionView.register(ImageDefaultCell.self, forCellWithReuseIdentifier:String(describing: ImageDefaultCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.isPagingEnabled = false
        collectionView.bounces = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
}

extension ImageGallery {
    
    func scrollToCell(at indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}

extension ImageGallery : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.galleryNumberOfItems() ?? 0;
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: ImageDefaultCell.self), for: indexPath) as! ImageDefaultCell
        let imageUrl = dataSource?.gallery(modelForItemAt: indexPath)?.imageUrl ?? ""
        cell.imageView.sd_setImage(with: URL(string: imageUrl))
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.size.width / 3, height: self.bounds.size.height / 2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let cellWidth = self.bounds.size.width / 3
        let padding = (self.bounds.size.width - cellWidth) / 2
        return UIEdgeInsets(top: 0, left: padding, bottom: 0, right: padding)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let cells = collectionView.visibleCells.filter { (cell) -> Bool in
            return cell.transform.a > 1
        }
        if (cells.count > 0) {
            delegate?.imageGallery(self, didScrollTo: collectionView.indexPath(for: cells[0])!)
        }
    }
}

