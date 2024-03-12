//
//  PosterCollectionViewCell.swift
//  PosterCollectionViewCell
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit

class PosterCollectionViewCell: UICollectionViewCell {
    static let identifier = "PosterCollectionViewCell"
    
    private let posterPhoto: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.backgroundColor = .red
        image.image = UIImage(named: "ios")
        return image
    }()
    
    private let posterUsername: UILabel = {
       let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        label.text = "yushun"
        label.sizeToFit()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        contentView.clipsToBounds = true
        contentView.addSubview(posterPhoto)
        contentView.addSubview(posterUsername)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageSize: CGFloat = (contentView.height)-20
        posterPhoto.frame = CGRect(x: 10, y: 10, width: imageSize, height: imageSize)
        posterPhoto.layer.cornerRadius = posterPhoto.width/2
        posterUsername.frame = CGRect(x: posterPhoto.right+10, y: 0, width: contentView.width-posterPhoto.width, height: contentView.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
//        posterPhoto.image = nil
//        posterUsername.text = nil
    }
}
