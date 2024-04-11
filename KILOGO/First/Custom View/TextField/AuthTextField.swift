//
//  AuthTextField.swift
//  AuthTextField
//
//  Created by 陳韋綸 on 2021/11/13.
//

import UIKit

class AuthTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    convenience init(fieldType: AuthTextFieldType) {
        self.init(frame: .zero)
        self.placeholder = fieldType.rawValue
        
        if fieldType == .password || fieldType == .passwordValidation {
            isSecureTextEntry = true
            textContentType = .oneTimeCode
        } else if fieldType == .email {
            keyboardType = .emailAddress
            textContentType = .emailAddress
        }
        configureUI()
    }
    
    
    private func configureUI() {
       
        layer.cornerRadius = 8
        layer.masksToBounds = true
        layer.borderWidth = 1
        layer.borderColor = UIColor.lightGray.cgColor
        
        backgroundColor = .systemGray6
        leftViewMode = .always
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: height))
        
        returnKeyType = .done
        autocapitalizationType = .none
        autocorrectionType = .no
        clearButtonMode = .whileEditing
        translatesAutoresizingMaskIntoConstraints = false
    }
}
