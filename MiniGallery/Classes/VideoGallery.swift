//
//  VideoGallery.swift
//  MiniGallery
//
//  Created by YuYongkai on 2019/4/18.
//

import UIKit
import AVKit

protocol VideoGalleryDelegate: class {
    func videoGallery(_ videoGallery: VideoGallery, didScrollTo indexPath: IndexPath)
}

class VideoGallery: UIView {
    
    var collectionView : UICollectionView!
    var flowLayout : UICollectionViewFlowLayout!
    weak var delegate: VideoGalleryDelegate?
    var dataSource: GalleryDataSource?
    
    lazy var avPlayer : AVPlayer = {
        let player = AVPlayer()
        return player
    }()
    
    lazy var avPlayerLayer : AVPlayerLayer = {
        let layer = AVPlayerLayer(player: self.avPlayer)
        layer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        return layer
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews();
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func setupViews() {
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.minimumLineSpacing = 0
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout);
        collectionView.register(VideoDefaultCell.self, forCellWithReuseIdentifier:String(describing: VideoDefaultCell.self))
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.backgroundColor = UIColor.white
        collectionView.isPagingEnabled = true
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.edges.equalTo(self)
        }
    }
    
    func removePlayerFromCell() {
        if (self.avPlayerLayer.superlayer != nil) {
            self.avPlayerLayer.removeFromSuperlayer()
            self.avPlayer.pause()
            self.avPlayer.replaceCurrentItem(with: nil)
        }
    }
}

// 外部调用
extension VideoGallery {
    
    func scrollToCell(at indexPath: IndexPath) {
        collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition.centeredHorizontally, animated: true)
    }
    
    func reloadData() {
        collectionView.reloadData()
    }
}

extension VideoGallery : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.galleryNumberOfItems() ?? 0;
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: VideoDefaultCell.self), for: indexPath) as! VideoDefaultCell
            
        let url = dataSource?.gallery(modelForItemAt: indexPath)?.videoUrl ?? ""
        cell.setVideoUrl(string: url)
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.bounds.size.width, height: self.bounds.size.height)
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let indexPath = collectionView.indexPathForItem(at: targetContentOffset.pointee)
        delegate?.videoGallery(self, didScrollTo: indexPath!)
    }
}
