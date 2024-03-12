//
//  skill.swift
//  skill
//
//  Created by 陳韋綸 on 2021/12/20.
//

import UIKit

protocol LevelSkill1PageModelsDelegate: AnyObject {
    func levelSkill1PageModels(math: Int)
}

class LevelSkill1PageModels: UIView {
    
    weak var delegate: LevelSkill1PageModelsDelegate?
    
    private let skillImage: UIImageView = {
       let image = UIImageView()
        return image
    }()
    
    private let skillTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private let skillLevel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private let skillMaxLevel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private let energyImage: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "能量")
        return image
    }()
    
    private let energyLabel: UILabel = {
       let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.text = "所需能量100"
        return label
    }()
    
    private let levelButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "技能升級"), for: .normal)
        return button
    }()
    
    var Level: Int = 3
    private let type: Mains
    
    init(type: Mains) {
        self.type = type
        super.init(frame: .zero)
        addSubview(skillImage)
        addSubview(skillTitle)
        addSubview(skillLevel)
        addSubview(skillMaxLevel)
        addSubview(energyImage)
        addSubview(energyLabel)
        addSubview(levelButton)
        configureUI()
    }

    func configureUI() {
        backgroundColor = #colorLiteral(red: 0.2264764011, green: 0.2719607651, blue: 0.360294044, alpha: 1)
        isUserInteractionEnabled = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9268269539, green: 0.7992469668, blue: 0.6303379536, alpha: 1)
        layer.shadowColor = UIColor.systemGray6.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        switch type {
        case .bear:
            skillImage.image = UIImage(named: "fire")
            skillTitle.text = "熊熊爆火"
            skillLevel.text = "Lv\(Level)"
            skillMaxLevel.text = "Max Lv10"
        case .girl:
            skillImage.image = UIImage(named: "")
            skillTitle.text = ""
            skillLevel.text = ""
            skillMaxLevel.text = ""
        case .boy:
            skillImage.image = UIImage(named: "")
            skillTitle.text = ""
            skillLevel.text = ""
            skillMaxLevel.text = ""
        }
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        skillImage.frame = CGRect(x: 0, y: 0, width: height, height: height)
        skillTitle.frame = CGRect(x: skillImage.right+10, y: 0, width: 100, height: height/3)
        skillLevel.frame = CGRect(x: skillImage.right+10, y: skillTitle.bottom, width: 100, height: height/3)
        skillMaxLevel.frame = CGRect(x: skillImage.right+10, y: skillLevel.bottom, width: 100, height: height/3)
        skillImage.layer.cornerRadius = height/2
        energyLabel.frame = CGRect(x: width-100, y: 0, width: 100, height: height/2)
        energyImage.frame = CGRect(x: energyLabel.left-height/2, y: 5, width: height/2-5, height: height/2-5)
        levelButton.frame = CGRect(x: width-120, y: energyLabel.bottom, width: 100, height: height/2-5)
        levelButton.addTarget(self, action: #selector(skillup), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    @objc func skillup(){
        
    delegate?.levelSkill1PageModels(math: 2)
    
        if Level <= 9 {
            Level += 1
            skillLevel.text = "Lv\(Level)"
        }
    }
}
