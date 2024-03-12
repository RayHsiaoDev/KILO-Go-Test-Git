//
//  PostLikeNumberCollectionViewCell.swift
//  PostLikeNumberCollectionViewCell
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit

class PostLikeNumberCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostLikeNumberCollectionViewCell"

    private let likeCount: UILabel = {
       let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.addSubview(likeCount)
        
        let LikeCount = Int().IntToString(with: 70000)
        
        likeCount.text = LikeCount + "個讚"
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let labelSize: CGFloat = contentView.height
        likeCount.frame = CGRect(x: 20, y: 0, width: contentView.width, height: labelSize)
    }
}
