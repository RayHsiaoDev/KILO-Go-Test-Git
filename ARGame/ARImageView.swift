//
//  ARSkillImageView.swift
//  ARSkillImageView
//
//  Created by 陳韋綸 on 2021/11/23.
//

import UIKit
import AVFAudio

class ARImageView: UIImageView {

    enum name {
        case attack
        case health
        case nirvana
        case background
        case leftButton
        case rightButton
        case resultsBackground
        case resultsImage
        case normal
        var imageName: String {
            switch self {
            case .attack:
                return "fire"
            case .health:
                return "tako"
            case .nirvana:
                return "hell"
            case .background:
                return "ListBackground"
            case .leftButton:
                return "leftButton"
            case .rightButton:
                return "rightButton"
            case .resultsBackground:
                return "gameResult"
            case .resultsImage:
                return "結算"
            case .normal:
                return ""
            }
        }
    }
   
    private let type: name
    
    init(type: name) {
        self.type = type
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configureUI() {
        image = UIImage(named: type.imageName)
        layer.masksToBounds = true
        
        if type == .normal {
            backgroundColor = .blue
        }
        else if type == .resultsBackground || type == .resultsImage {
            contentMode = .scaleToFill
        }
        else {
            transform = CGAffineTransform(scaleX: -1, y: 1)
            contentMode = .scaleAspectFill
        }
    }
}
