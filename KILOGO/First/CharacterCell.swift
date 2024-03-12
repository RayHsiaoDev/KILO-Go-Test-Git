//
//  CharacterCell.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/2/23.
//

import UIKit

class CharacterCell: UICollectionViewCell {
    
    let characterImage = UIImageView()
    let shadow = UIImageView()
    let characterLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureImage()
        configureShadow()
        configureLabel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureImage(){
        characterImage.backgroundColor = .clear
        characterImage.contentMode = .scaleAspectFill
        addSubview(characterImage)
        
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImage.widthAnchor.constraint(equalToConstant: 248),
            characterImage.heightAnchor.constraint(equalToConstant: 423)
        ])
//        CharacterImage.contentMode = .scaleAspectFit
        
    }
    
    
    func configureShadow() {
        shadow.backgroundColor = .clear
        shadow.contentMode = .scaleAspectFill
        shadow.layer.zPosition = characterImage.layer.zPosition - 1
        addSubview(shadow)
        
        shadow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            shadow.centerXAnchor.constraint(equalTo: centerXAnchor),
            shadow.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -90),
            shadow.widthAnchor.constraint(equalToConstant: 248),
            shadow.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureLabel() {
        characterLabel.textAlignment = .center
        characterLabel.textColor = .black
        characterLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        addSubview(characterLabel)
        
        characterLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            characterLabel.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -15),
            characterLabel.widthAnchor.constraint(equalToConstant: 100),
            characterLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
