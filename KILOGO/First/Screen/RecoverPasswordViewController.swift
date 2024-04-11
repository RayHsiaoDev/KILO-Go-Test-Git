//
//  RecoverPasswordViewController.swift
//  RecoverPasswordViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit

class RecoverPasswordViewController: UIViewController {
    
    let backButton = BackButton()
    let recoverPasswordTitle = UILabel()
    let recoverTextField = AuthTextField(fieldType: .email)
    let sendButton = AuthButton(buttontype: .forgotPasswordPageSend)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backButton)
        view.addSubview(recoverPasswordTitle)
        view.addSubview(recoverTextField)
        view.addSubview(sendButton)
        configureBackButton()
        configureTitleLabel()
        configureRecoverTextField()
        configureSendButton()
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
    }
    
    
    func configureBackButton() {
        backButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            backButton.widthAnchor.constraint(equalToConstant: 20),
            backButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureTitleLabel() {
        recoverPasswordTitle.text = "恢復密碼"
        recoverPasswordTitle.textAlignment = .center
        recoverPasswordTitle.font = .systemFont(ofSize: 40, weight: .bold)
        recoverPasswordTitle.textColor = .brown
        
        recoverPasswordTitle.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            recoverPasswordTitle.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 190),
            recoverPasswordTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recoverPasswordTitle.widthAnchor.constraint(equalToConstant: view.width),
            recoverPasswordTitle.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureRecoverTextField() {
        NSLayoutConstraint.activate([
            recoverTextField.topAnchor.constraint(equalTo: recoverPasswordTitle.bottomAnchor, constant: 70),
            recoverTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recoverTextField.widthAnchor.constraint(equalToConstant: 350),
            recoverTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureSendButton() {
        sendButton.layer.cornerRadius = 18
        sendButton.addTarget(self, action: #selector(didTapBack), for: .touchUpInside)
        
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            sendButton.topAnchor.constraint(equalTo: recoverTextField.bottomAnchor, constant: 160),
            sendButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            sendButton.widthAnchor.constraint(equalToConstant: 350),
            sendButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc private func didTapBack() {
        dismiss(animated: true, completion: nil)
    }
    
}
