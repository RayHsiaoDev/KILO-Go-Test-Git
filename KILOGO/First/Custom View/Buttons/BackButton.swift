//
//  BackButton.swift
//  BackButton
//
//  Created by 陳韋綸 on 2021/11/16.
//

import Foundation
import UIKit

class BackButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureUI() {
        setBackgroundImage(UIImage(systemName: "chevron.left"), for: .normal)
        tintColor = .blue
        layer.masksToBounds = true
    }
}
