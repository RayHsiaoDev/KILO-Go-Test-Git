//
//  SkillView.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/27.
//

import UIKit

enum skillType {
    case skillOne, skillTwo, skillThree
}

class SkillView: UIView {
    
    let skillImage = UIImageView()
    let skillName = UILabel()
    let skillLevel = UILabel()
    let skillMaxLevel = UILabel()
    let energeImage = UIImageView()
    let upgreatLabel = UILabel()
    let upgreatButton = UIButton()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureView()
        configureSkillImage()
        configureSkillName()
        configureSkillLevel()
        configureSkillMaxLevel()
        configureUpgreatLabel()
        configureEnergyImage()
        configureUpgreatButton()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureView() {
        backgroundColor = #colorLiteral(red: 0.2264764011, green: 0.2719607651, blue: 0.360294044, alpha: 1)
        isUserInteractionEnabled = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9268269539, green: 0.7992469668, blue: 0.6303379536, alpha: 1)
        layer.shadowColor = UIColor.systemGray6.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    
    func configureSkillImage() {
        skillImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            skillImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            skillImage.widthAnchor.constraint(equalToConstant: 50),
            skillImage.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureSkillName() {
        skillName.font = .systemFont(ofSize: 14, weight: .bold)
        skillName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillName.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            skillName.leadingAnchor.constraint(equalTo: skillImage.trailingAnchor, constant: 2),
            skillName.widthAnchor.constraint(equalToConstant: 15),
            skillName.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    
    func configureSkillLevel() {
        skillLevel.font = .systemFont(ofSize: 14, weight: .bold)
        skillLevel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillLevel.topAnchor.constraint(equalTo: skillName.topAnchor, constant: 2),
            skillLevel.leadingAnchor.constraint(equalTo: skillImage.trailingAnchor, constant: 2),
            skillLevel.widthAnchor.constraint(equalToConstant: 15),
            skillLevel.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    
    func configureSkillMaxLevel() {
        skillMaxLevel.text = "Max Lv10"
        skillMaxLevel.font = .systemFont(ofSize: 14, weight: .bold)
        skillMaxLevel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillMaxLevel.topAnchor.constraint(equalTo: skillLevel.topAnchor, constant: 2),
            skillMaxLevel.leadingAnchor.constraint(equalTo: skillImage.trailingAnchor, constant: 2),
            skillMaxLevel.widthAnchor.constraint(equalToConstant: 15),
            skillMaxLevel.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    
    func configureUpgreatLabel() {
        upgreatLabel.text = "所需能量100"
        upgreatLabel.font = .systemFont(ofSize: 14, weight: .bold)
        upgreatLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upgreatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            upgreatLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            upgreatLabel.widthAnchor.constraint(equalToConstant: 15),
            upgreatLabel.heightAnchor.constraint(equalToConstant: 5)
        ])
    }
    
    
    func configureEnergyImage() {
        energeImage.image = UIImage(named: "能量")
        energeImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            energeImage.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            energeImage.trailingAnchor.constraint(equalTo: upgreatLabel.leadingAnchor, constant: 2),
            energeImage.widthAnchor.constraint(equalToConstant: 10),
            energeImage.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    
    func configureUpgreatButton() {
        upgreatButton.setImage(UIImage(named: "技能升級"), for: .normal)
        upgreatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upgreatButton.topAnchor.constraint(equalTo: upgreatLabel.bottomAnchor, constant: 2),
            upgreatButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -2),
            upgreatButton.widthAnchor.constraint(equalToConstant: 30),
            upgreatButton.heightAnchor.constraint(equalToConstant: 10)
        ])
    }
    
    
    func set(skillType: skillType) {
        switch skillType {
        case .skillOne:
            skillImage.image = UIImage(named: "fire")
            skillName.text = "熊熊爆火"
            skillLevel.text = "Lv4"
        case .skillTwo:
            skillImage.image = UIImage(named: "tako")
            skillName.text = "章魚燒的庇佑"
            skillLevel.text = "Lv4"
        case .skillThree:
            skillImage.image = UIImage(named: "hell")
            skillName.text = "地獄鬼火"
            skillLevel.text = "Lv4"
        }
    }
}
