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
        addSubview(skillImage)
        addSubview(skillName)
        addSubview(skillLevel)
        addSubview(skillMaxLevel)
        addSubview(energeImage)
        addSubview(upgreatLabel)
        addSubview(upgreatButton)
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
        backgroundColor = #colorLiteral(red: 0.2264763713, green: 0.2719607651, blue: 0.360294044, alpha: 1)
        isUserInteractionEnabled = true
        layer.cornerRadius = 26
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9268269539, green: 0.7992469668, blue: 0.6303379536, alpha: 1)
        layer.shadowColor = UIColor.systemGray6.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 1)
    }
    
    
    func configureSkillImage() {
        skillImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -1),
            skillImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            skillImage.widthAnchor.constraint(equalToConstant: 85),
            skillImage.heightAnchor.constraint(equalToConstant: 85)
        ])
    }
    
    
    func configureSkillName() {
        skillName.textColor = .white
        skillName.font = .systemFont(ofSize: 14, weight: .bold)
        skillName.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillName.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            skillName.leadingAnchor.constraint(equalTo: skillImage.trailingAnchor, constant: 2),
            skillName.widthAnchor.constraint(equalToConstant: 90),
            skillName.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    func configureSkillLevel() {
        skillLevel.textColor = .white
        skillLevel.font = .systemFont(ofSize: 14, weight: .bold)
        skillLevel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillLevel.topAnchor.constraint(equalTo: skillName.bottomAnchor, constant: 0),
            skillLevel.leadingAnchor.constraint(equalTo: skillImage.trailingAnchor, constant: 2),
            skillLevel.widthAnchor.constraint(equalToConstant: 50),
            skillLevel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureSkillMaxLevel() {
        skillMaxLevel.text = "Max Lv10"
        skillMaxLevel.textColor = .white
        skillMaxLevel.font = .systemFont(ofSize: 14, weight: .bold)
        skillMaxLevel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillMaxLevel.topAnchor.constraint(equalTo: skillLevel.bottomAnchor, constant: 1),
            skillMaxLevel.leadingAnchor.constraint(equalTo: skillImage.trailingAnchor, constant: 2),
            skillMaxLevel.widthAnchor.constraint(equalToConstant: 85),
            skillMaxLevel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureUpgreatLabel() {
        upgreatLabel.text = "所需能量100"
        upgreatLabel.textColor = .white
        upgreatLabel.font = .systemFont(ofSize: 14, weight: .bold)
        upgreatLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upgreatLabel.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            upgreatLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            upgreatLabel.widthAnchor.constraint(equalToConstant: 85),
            upgreatLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureEnergyImage() {
        energeImage.image = UIImage(named: "能量")
        energeImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            energeImage.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            energeImage.trailingAnchor.constraint(equalTo: upgreatLabel.leadingAnchor, constant: -1),
            energeImage.widthAnchor.constraint(equalToConstant: 35),
            energeImage.heightAnchor.constraint(equalToConstant: 35)
        ])
    }
    
    
    func configureUpgreatButton() {
        upgreatButton.setImage(UIImage(named: "技能升級"), for: .normal)
        upgreatButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            upgreatButton.topAnchor.constraint(equalTo: upgreatLabel.bottomAnchor, constant: 6),
            upgreatButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -14),
            upgreatButton.widthAnchor.constraint(equalToConstant: 100),
            upgreatButton.heightAnchor.constraint(equalToConstant: 35)
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
