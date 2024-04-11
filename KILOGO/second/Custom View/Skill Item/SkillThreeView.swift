//
//  SkillThreeView.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/27.
//

import UIKit

class SkillThreeView: SkillView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        set(skillType: .skillThree)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
