//
//  ViewController.swift
//  KILOGO
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit

class SignInViewController: UIViewController {
    
    let iconImage = UIImageView()
    let iconLabel = UILabel()
    let titleLabel = UILabel()
    let signView = UIView()
    var itemViews: [UIView] = []
    var topAnchor: NSLayoutConstraint!
    var widthAnchor: NSLayoutConstraint!
    var heightAnchor: NSLayoutConstraint!
    let backButton = BackButton()
    let emailField = AuthTextField(fieldType: .email)
    let passwordField = AuthTextField(fieldType: .password)
    let signInButton = AuthButton(buttontype: .signIn)
    let forgotPasswordButton = AuthButton(buttontype: .forgotPassword)
  

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        addSubviewUI()
        configureBackButton()
        configureIconImage()
        configureIconLabel()
        configureTitleLabel()
        configureSignView()
        layoutUI()
        configureSignUpButton()
        configureForgotPasswordButton()
        
    }
    
    
    private func addSubviewUI() {
        self.presentingViewController
        view.addSubview(backButton)
        view.addSubview(iconImage)
        view.addSubview(iconLabel)
        view.addSubview(signView)
        signView.addSubview(titleLabel)
        signView.addSubview(emailField)
        signView.addSubview(passwordField)
        signView.addSubview(signInButton)
        signView.addSubview(forgotPasswordButton)
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
        titleLabel.text = "登入"
        
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
        itemViews = [emailField, passwordField]
        let padidng: CGFloat = 30
        let itemHeight: CGFloat = 50
        
        for itemView in itemViews {
            NSLayoutConstraint.activate([
                itemView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padidng),
                itemView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padidng)
            ])
        }
        
        NSLayoutConstraint.activate([
            emailField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            emailField.heightAnchor.constraint(equalToConstant: itemHeight),
            
            passwordField.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 20),
            passwordField.heightAnchor.constraint(equalToConstant: itemHeight)
        ])
    }
    
    
    func configureSignUpButton() {
        signInButton.layer.cornerRadius = 16
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalTo: passwordField.bottomAnchor, constant: 80),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureForgotPasswordButton() {
        forgotPasswordButton.layer.cornerRadius = 16
        forgotPasswordButton.addTarget(self, action: #selector(didTapForgotPassword), for: .touchUpInside)
        
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            forgotPasswordButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 30),
            forgotPasswordButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            forgotPasswordButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc private func didTapSignIn() {
        
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordField.text, !password.isEmpty else {
            let alert = UIAlertController(title: "錯誤", message: "請檢查欄位是否填寫完整", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "確定", style: .cancel))
            self.present(alert, animated: true)
            return
        }
        
        AuthManager2.share.userSignIn(email: email, password: password) { [weak self] result in
            guard let self = self else { return }

                switch result {
                    
                case .success(let ok):
                    RealtimeDatabaseManager.shared.firstTime(email: email) { result in
                        DispatchQueue.main.async {
                            if result == 1 {
                                    let vc = LabelViewController()
    //                                let vc = HomePageViewController()
//                                    let vc = ChooseMainViewController()
                                    vc.vc.delegate = self
                                    vc.modalPresentationStyle = .fullScreen
                                    self.present(vc, animated: true)
                            } else {
    //                                let vc = HomePageViewController()
//                                    let vc = LabelViewController()
                                    let vc = ChooseMainViewController()
                                    vc.delegate = self
                                    vc.modalPresentationStyle = .fullScreen
                                    self.present(vc, animated: true)
                            }
                        }
                    }

                case .failure(let error):
                    let alert = UIAlertController(title: "無法登入", message: "帳號或密碼錯誤", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "ok", style: .cancel))
                    self.present(alert, animated: true)
                }
        }
        
//        guard let email = emailField.text, !email.isEmpty,
//              let password = passwordField.text, !password.isEmpty else {
//                  let alert = UIAlertController(title: "錯誤", message: "請確認你的欄位填寫是否正確", preferredStyle: .alert)
//                  alert.addAction(UIAlertAction(title: "確定", style: .cancel, handler: nil))
//                  self.present(alert, animated: true, completion: nil)
//                  return
//              }
//        AuthManager.shared.signInAcount(email: email, password: password) { [weak self] success in
//            DispatchQueue.main.async {
//                if success {
//                    AuthManager.shared.isFirstSignIn(email: email) { nofirst in
//                        if nofirst {
//                            self?.view.window?.rootViewController = TabBarViewController()
//                        }
//                        else {
//                            let vc = LabelViewController()
//                            vc.modalPresentationStyle = .fullScreen
//                            self?.present(vc, animated: true, completion: nil)
//                        }
//                    }
//                }
//                else {
//                    let alert = UIAlertController(title: "錯誤", message: "登入失敗", preferredStyle: .alert)
//                    alert.addAction(UIAlertAction(title: "確定", style: .cancel, handler: nil))
//                    self?.present(alert, animated: true, completion: nil)
//                }
//            }
//        }
    }
    
    
    @objc private func didTapBack() {
        dismiss(animated: true, completion: nil)
    }

    
    @objc private func didTapForgotPassword() {
        DispatchQueue.main.async {
            let vc = RecoverPasswordViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}


extension SignInViewController: ChooseMainViewControllerDelegate {
    func didTapConFirm() {
        let email = emailField.text
        guard let email = email else { return }
        RealtimeDatabaseManager.shared.ref.child("email:\(email.emailEncoder())").child("firstTime").setValue(false)
        print("委託成功！！")
    }
}

