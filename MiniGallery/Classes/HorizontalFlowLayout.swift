//
//  HorizontalFlowLayout.swift
//  MiniGallery
//
//  Created by YuYongkai on 2019/4/18.
//

import UIKit

class HorizontalFlowLayout: UICollectionViewFlowLayout {
    
    override open func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let collection = self.collectionView else {return proposedContentOffset}
        
        let collectionViewSize = collection.bounds.size
        let proposedRect = CGRect(x: proposedContentOffset.x, y: 0, width: collectionViewSize.width, height: collectionViewSize.height)
        
        guard let layoutAttributes = self.layoutAttributesForElements(in: proposedRect) else {return proposedContentOffset}
        
        var candidateAttributes: UICollectionViewLayoutAttributes?
        let proposedContentOffsetCenterX = proposedContentOffset.x + collectionViewSize.width / 2
        
        for attributes: UICollectionViewLayoutAttributes in layoutAttributes {
            if attributes.representedElementCategory != .cell {
                continue
            }
            
            if candidateAttributes == nil {
                candidateAttributes = attributes
                continue
            }
            
            if abs(attributes.center.x - proposedContentOffsetCenterX) < abs(candidateAttributes!.center.x - proposedContentOffsetCenterX) {
                candidateAttributes = attributes
            }
        }
        
        guard (candidateAttributes != nil) else {return proposedContentOffset}
        
        var newOffsetX = candidateAttributes!.center.x - self.collectionView!.bounds.size.width / 2
        
        let offset = newOffsetX - self.collectionView!.contentOffset.x
        
        if (velocity.x < 0 && offset > 0) || (velocity.x > 0 && offset < 0) {
            let pageWidth = self.itemSize.width + self.minimumLineSpacing
            newOffsetX += velocity.x > 0 ? pageWidth : -pageWidth
        }
        return CGPoint(x: newOffsetX, y: proposedContentOffset.y)
    }
    
    override open func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        let centerX = collectionView!.contentOffset.x + collectionView!.bounds.width / 2
        
        attributes!.forEach({ (attr) in
            let pad = abs(centerX - attr.center.x)
            let scale = max(1.25 - pad / collectionView!.bounds.width, 1)
            attr.transform = CGAffineTransform(scaleX: scale, y: scale)
        })
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
}
