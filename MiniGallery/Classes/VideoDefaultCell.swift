//
//  VideoDefaultCell.swift
//  MiniGallery
//
//  Created by YuYongkai on 2019/4/18.
//

import UIKit
import SnapKit
import AVKit

class VideoDefaultCell: UICollectionViewCell {
    
    var avPlayer: AVPlayer!
    var playerLayer: AVPlayerLayer!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        avPlayer = AVPlayer()
        playerLayer = AVPlayerLayer(player: avPlayer)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer.frame = self.bounds
        contentView.layer.addSublayer(playerLayer)
        
        contentView.backgroundColor = UIColor(red: 164/255, green: 176/255, blue: 190/255, alpha: 0.5)
        
        loopVideo(videoPlayer: avPlayer)
    }
    
    func setVideoUrl(string: String) {
        avPlayer.replaceCurrentItem(with: nil)
        
        let url = URL(string: string)
        
        // let asset = AVURLAsset(url: url!)
        // asset.resourceLoader.delegate = MiniCacheManager.shared
        
        let playerItem = AVPlayerItem(url: url!)
        avPlayer.replaceCurrentItem(with: playerItem)
        self.avPlayer.play()
    }
    
    func loopVideo(videoPlayer: AVPlayer) {
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: nil, queue: nil, using: {_ in
            videoPlayer.seek(to: .zero)
            videoPlayer.play()
        })
    }
}

