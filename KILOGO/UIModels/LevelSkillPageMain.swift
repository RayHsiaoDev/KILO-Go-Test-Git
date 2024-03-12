//
//  LevelSkillPageMain.swift
//  LevelSkillPageMain
//
//  Created by 陳韋綸 on 2021/12/20.
//

import UIKit

enum Mains {
    case bear
    case girl
    case boy
    var main: String {
        switch self {
        case .bear:
            return "bearMain"
        case .girl:
            return "girlMain"
        case .boy:
            return "boyMain"
        }
    }
}

class LevelSkillPageMain: UIImageView {
    
    private let type: Mains
    
    init(type: Mains) {
        self.type = type
        super.init(frame: .zero)
        configureUI()
    }
    
    func configureUI() {
        image = UIImage(named: type.main)
        layer.masksToBounds = true
        contentMode = .scaleAspectFit
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
