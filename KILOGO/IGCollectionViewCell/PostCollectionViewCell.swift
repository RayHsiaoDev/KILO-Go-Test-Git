//
//  PostCollectionViewCell.swift
//  PostCollectionViewCell
//
//  Created by 陳韋綸 on 2021/11/10.
//


import UIKit

protocol PostCollectionViewCellDelegate: AnyObject {
    func postCollectionViewCellDidTapPost(_ cell: PostCollectionViewCell)
}

class PostCollectionViewCell: UICollectionViewCell {
    static let identifier = "PostCollectionViewCell"
    
    weak var delegate: PostCollectionViewCellDelegate?
    
    private let postImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(named: "gradient")
        image.isUserInteractionEnabled = true
        return image
    }()
    
    private let heartImageView: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.image = UIImage(systemName: "heart.fill")
        image.tintColor = .red
        image.isHidden = true
        image.alpha = 0
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.addSubview(postImage)
        contentView.addSubview(heartImageView)
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapImage))
        tap.numberOfTapsRequired = 2
        postImage.addGestureRecognizer(tap)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func didTapImage() {
        heartImageView.isHidden = false
        UIView.animate(withDuration: 0.6) {
            self.heartImageView.alpha = 1
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.5) {
                    self.heartImageView.alpha = 0
                } completion: { done in
                    if done {
                        self.heartImageView.isHidden = true
                    }
                }
            }
        }
        delegate?.postCollectionViewCellDidTapPost(self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        postImage.frame = contentView.bounds
        let heartSize: CGFloat = contentView.width/5
        heartImageView.frame = CGRect(x: 0, y: 0, width: heartSize, height: heartSize)
        heartImageView.center = postImage.center
    }
    
    override func prepareForReuse() {
//        postImage.image = nil
    }
}
