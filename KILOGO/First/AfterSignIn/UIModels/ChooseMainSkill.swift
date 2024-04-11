//
//  ChooseMainSkill.swift
//  ChooseMainSkill
//
//  Created by 陳韋綸 on 2021/12/6.
//

import UIKit

class ChooseMainSkill: UIImageView {
    
    enum SkillImageType {
        case bearAttack
        case bearHealth
        case bearkiller
        var imageName: String {
            switch self {
            case .bearAttack:
                return "fire"
            case .bearHealth:
                return "tako"
            case .bearkiller:
                return "hell"
            }
        }
    }
    
    private let type: SkillImageType

    init(type: SkillImageType) {
        self.type = type
        super.init(frame: .zero)
        self.isUserInteractionEnabled = true
        configureUI()
    }
    
    private func configureUI() {
        image = UIImage(named: type.imageName)
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
