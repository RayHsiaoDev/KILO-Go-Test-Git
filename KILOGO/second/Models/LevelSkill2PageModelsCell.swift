//
//  LevelSkill1PageModelsCell.swift
//  LevelSkill1PageModelsCell
//
//  Created by 陳韋綸 on 2021/12/20.
//

import UIKit
import CoreMedia

class LevelSkill2PageModelsCell: UIView {

    private let skillTitle: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private let skillValue: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    private let image: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(systemName: "arrow.right")
        image.tintColor = .white
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    private let skillValue2: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .white
        label.sizeToFit()
        return label
    }()
    
    var Value: Int = 20
    var Value2: Int = 25
    private let type: Mains
    
    init(type: Mains) {
        self.type = type
        super.init(frame: .zero)
        addSubview(skillTitle)
        addSubview(skillValue)
        addSubview(image)
        addSubview(skillValue2)
        configureUI()
    }
    
    func configureUI() {
        backgroundColor = UIColor.black.withAlphaComponent(0.7)
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.9268269539, green: 0.7992469668, blue: 0.6303379536, alpha: 1)
        layer.shadowColor = UIColor.systemGray6.cgColor
        layer.shadowOpacity = 1
        layer.shadowOffset = CGSize(width: 0, height: 1)
        switch type {
        case .bear:
            skillTitle.text = "吃了章魚燒後可以恢復自身生命"
            skillValue.text = "治癒力 + \(Value)"
            skillValue2.text = "+\(Value2)"
        case .girl:
            skillTitle.text = ""
            skillValue.text = ""
        case .boy:
            skillTitle.text = ""
            skillValue.text = ""
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        skillTitle.frame = CGRect(x: 20, y: height/2+10, width: width, height: height/4)
        skillValue.frame = CGRect(x: 20, y: skillTitle.bottom-10, width: width/5, height: height/4)
        image.frame = CGRect(x: skillValue.right+20, y: skillTitle.bottom-10+height/8/2, width: height/8, height: height/8)
        skillValue2.frame = CGRect(x: image.right+20, y: skillTitle.bottom-10, width: width/3, height: height/4)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
