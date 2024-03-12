//
//  PostButtonCollectionViewCell.swift
//  PostButtonCollectionViewCell
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit

protocol PostButtonCollectionViewCellDelegate: AnyObject {
    func postButtonCollectionViewCelldidTapLikeButton(_ cell: PostButtonCollectionViewCell, isLiked: Bool)
}

class PostButtonCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostButtonCollectionViewCell"
    
    weak var delegate: PostButtonCollectionViewCellDelegate?
    
    private var isLiked = false
    
    private let likeButton: UIButton = {
       let button = UIButton()
        button.setBackgroundImage(UIImage(systemName: "suit.heart"), for: .normal)
        
        button.tintColor = .black
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.addSubview(likeButton)
        likeButton.addTarget(self, action: #selector(didTapLike), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func didTapLike() {
        if self.isLiked {
            likeButton.setBackgroundImage(UIImage(systemName: "suit.heart"), for: .normal)
            likeButton.tintColor = .black
        }
        else {
            likeButton.setBackgroundImage(UIImage(systemName: "heart.fill"), for: .normal)
            likeButton.tintColor = .red
        }
        delegate?.postButtonCollectionViewCelldidTapLikeButton(self, isLiked: !isLiked)
        self.isLiked = !isLiked
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let buttonSize: CGFloat = contentView.height-10
        likeButton.frame = CGRect(x: 30, y: 5, width: buttonSize+5, height: buttonSize)
    }
}
