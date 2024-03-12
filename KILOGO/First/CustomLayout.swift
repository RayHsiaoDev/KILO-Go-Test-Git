//
//  CustomLayout.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/2/26.
//

import UIKit

class CustomLaytout: UICollectionViewFlowLayout {
    
    var previousOffset: CGFloat = 0.0
    var currentPage = 0
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        guard let cv = collectionView else {
            return super.targetContentOffset(forProposedContentOffset: proposedContentOffset, withScrollingVelocity: velocity)
        }
        
        let itemCount = cv.numberOfItems(inSection: 0)
        
        if previousOffset > cv.contentOffset.x && velocity.x < 0.0 {
            currentPage = max(currentPage - 1, 0)
        } else if previousOffset < cv.contentOffset.x && velocity.x > 0.0 {
            currentPage = min(currentPage + 1, itemCount - 1)
        }
        
        print("當前collectionView頁面\(currentPage)")
        
        let collectionviewWidth = cv.frame.width
        let itemWidth = itemSize.width
        let sp = minimumLineSpacing
        let edge = (collectionviewWidth - itemWidth - sp*2) / 2
        let offset = (itemWidth + sp) * CGFloat(currentPage) - (edge + sp)
        previousOffset = offset
         
        return CGPoint(x: offset, y: proposedContentOffset.y)
    }
    
}
