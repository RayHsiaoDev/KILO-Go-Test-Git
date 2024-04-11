//
//  DataPickerContainerView.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/20.
//

import UIKit

class DataPickerContainerView: UIView {
    
    let label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        layer.cornerRadius = 16
        layer.borderWidth = 2
        layer.borderColor = UIColor.white.cgColor
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
