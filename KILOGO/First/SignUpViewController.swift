//
//  SignUpViewController.swift
//  SignUpViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit

class SignUpViewController: UIViewController {
    
    let iconImage = UIImageView()
    let iconLabel = UILabel()
    let titleLabel = UILabel()
    let signView = UIView()
    var topAnchor: NSLayoutConstraint!
    var widthAnchor: NSLayoutConstraint!
    var heightAnchor: NSLayoutConstraint!
    var itemViews: [UIView] = []
    let backButton = BackButton()
    let usernameField = AuthTextField(fieldType: .username)
    let emailField = AuthTextField(fieldType: .email)
    let passwordField = AuthTextField(fieldType: .password)
    let passwordValidationField = AuthTextField(fieldType: .passwordValidation)
    let signUpButton = AuthButton(buttontype: .signUp)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        signView.frame = CGRect(x: 0, y: view.bottom, width: view.width, height: 0)
        addSubviewUI()
        configureIconImage()
        configureIconLabel()
        configureTitleLabel()
        configureBackButton()
        configureSignView()
        layoutUI()
        configureSignUpButton()
    }
    
    
    func addSubviewUI() {
        view.addSubview(backButton)
        view.addSubview(iconImage)
        view.addSubview(iconLabel)
        view.addSubview(signView)
        signView.addSubview(titleLabel)
        signView.addSubview(usernameField)
        signView.addSubview(emailField)
        signView.addSubview(passwordField)
        signView.addSubview(passwordValidationField)
        signView.addSubview(signUpButton)
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
    
    
    func configureIconImage() {
       iconImage.layer.masksToBounds = true
       iconImage.contentMode = .scaleAspectFill
       iconImage.backgroundColor = .blue
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 55),
            iconImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            iconImage.widthAnchor.constraint(equalToConstant: 80),
            iconImage.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureIconLabel() {
       iconLabel.text = "燃燒你的卡路里"
       iconLabel.textColor = .white
       iconLabel.font = .systemFont(ofSize: 30)
        
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            iconLabel.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 25),
            iconLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            iconLabel.widthAnchor.constraint(equalToConstant: 300),
            iconLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureTitleLabel() {
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 40, weight: .semibold)
        titleLabel.text = "註冊"
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: signView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            titleLabel.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
   
    func configureSignView() {
        signView.backgroundColor = .white
        signView.layer.borderWidth = 1
        signView.layer.cornerRadius = 30
        signView.layer.masksToBounds = true
        signView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        signView.translatesAutoresizingMaskIntoConstraints = false
        topAnchor = signView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        widthAnchor = signView.widthAnchor.constraint(equalToConstant: view.width)
        heightAnchor = signView.heightAnchor.constraint(equalToConstant: view.height)
        NSLayoutConstraint.activate([topAnchor, widthAnchor, heightAnchor])
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1/3) {
            self.signViewAnimation()
        }
    }
    
    
    func signViewAnimation() {
        topAnchor.constant = -view.height + iconLabel.frame.maxY + 20
            
        UIView.animate(withDuration: 1/2) { [weak self] in
            guard let self = self else { return }
            self.view.layoutIfNeeded()
        }
    }
    
    
    func layoutUI() {
        itemViews = [usernameField, emailField, passwordField, passwordValidationField]
        let padidng: CGFloat = 30
        let itemHeight: CGFloat = 50
        
        for itemView in itemViews {
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padidng),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padidng)
            ])
        }
        
        NSLayoutConstraint.activate([
            usernameField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            usernameField.heightAnchor.constraint(equalToConstant: itemHeight),
            
            emailField.topAnchor.constraint(equalTo: usernameField.bottomAnchor, constant: 20),
            emailField.heightAnchor.constraint(equalToConstant: itemHeight),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.heightAnchor.constraint(equalToConstant: itemHeight),
            
            passwordValidationField.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 20),
            passwordValidationField.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    
    func configureSignUpButton() {
        signUpButton.layer.cornerRadius = 16
        signUpButton.addTarget(self, action: #selector(didTapSignUp), for: .touchUpInside)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: passwordValidationField.bottomAnchor, constant: 80),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc private func didTapBack() {
        dismiss(animated: true, completion: nil)
    }
    
    
    @objc private func didTapSignUp() {
    
        guard let username = usernameField.text, !username.isEmpty,
        let email = emailField.text, !email.isEmpty,
        let password = passwordField.text, !password.isEmpty,
        let passwordValidation = passwordValidationField.text, !passwordValidation.isEmpty else {
            let alert = UIAlertController(title: "錯誤", message: "請檢查您的欄位是否有填寫完整", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .cancel))
            self.present(alert, animated: true)
            return
        }
        
        guard password.count >= 6 else {
            let alert = UIAlertController(title: "錯誤", message: "密碼至少6個字元喔", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .cancel))
            self.present(alert, animated: true)
            return
            
        }
        
        guard password == passwordValidation else {
            let alert = UIAlertController(title: "錯誤", message: "確認密碼錯誤", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .cancel))
            self.present(alert, animated: true)
            return
        }
        
        AuthManager2.share.createAcount(email: email, password: password, userName: username) { result in
            switch result {
            case.failure(let error):
                let alert = UIAlertController(title: "錯誤", message: "\(error)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "確定", style: .cancel))
                self.present(alert, animated: true)
                
            case.success(let success):
                print("註冊成功")
                RealtimeDatabaseManager.shared.createUserDataBase(email: email, password: password, userName: username)
                
                DispatchQueue.main.async {
                    let vc = FirstPageViewController()
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true)
                }
                
            }
            AuthManager2.share.userSignOut()
        }
        
    
//        AuthManager.shared.createAcount(username: username, email: email, password: password) { [weak self] success in
//            DispatchQueue.main.async {
//                if success {
//                    self?.dismiss(animated: true, completion: nil)
//                }
//                else {
//                    let alert = UIAlertController(title: "錯誤", message: "註冊失敗", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "確定", style: .cancel, handler: nil))
//                    self?.present(alert, animated: true, completion: nil)
//                }
//            }
//        }
    }
    

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
