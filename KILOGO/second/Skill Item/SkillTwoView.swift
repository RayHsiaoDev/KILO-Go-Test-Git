//
//  SkillTwoView.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/27.
//

import UIKit

class SkillTwoView: SkillView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        set(skillType: .skillTwo)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
