//
//  AuthButton.swift
//  AuthButton
//
//  Created by 陳韋綸 on 2021/11/13.
//

import UIKit

class AuthButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    convenience init(buttontype: AuthButtonType) {
        self.init(frame: .zero)
        self.setTitle(buttontype.rawValue, for: .normal)
        
        if buttontype == .forgotPassword {
            self.setTitleColor(.black, for: .normal)
            self.backgroundColor = .clear
        } else if buttontype == .firstPageSignIn {
            self.setTitleColor(.brown, for: .normal)
            self.backgroundColor = .clear
        } else {
            self.setTitleColor(.white, for: .normal)
            self.backgroundColor = .orange
        }
    }
    
    
    private func configureUI() {
        layer.masksToBounds = true
    }
}
