//
//  ImageModels.swift
//  ImageModels
//
//  Created by 陳韋綸 on 2021/12/20.
//

import Foundation
import UIKit

enum backgroundIM {
    case LevelBackground
    var imageName: String {
        switch self {
        case .LevelBackground:
            return "技能背景"
        }
    }
}

class ImageModels: UIImageView {
    
    private let type: backgroundIM
    
    init(type: backgroundIM) {
        self.type = type
        super.init(frame: .zero)
        configureUI()
    }
    
    func configureUI() {
        layer.masksToBounds = true
        image = UIImage(named: type.imageName)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}
