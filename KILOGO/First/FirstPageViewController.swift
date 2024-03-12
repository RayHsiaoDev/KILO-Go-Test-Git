//
//  FirstPageViewController.swift
//  FirstPageViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit

class FirstPageViewController: UIViewController {
    
    let logoImage = UIImageView()
    let signUpButton = AuthButton(buttontype: .firstPageSignUp)
    let signInButton = AuthButton(buttontype: .firstPageSignIn)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(logoImage)
        view.addSubview(signInButton)
        view.addSubview(signUpButton)
        configureLogoImageView()
        configureSignInButton()
        configureSignUpButton()
        
        AuthManager2.share.userSignOut()
        if AuthManager2.share.isSignin  {
            let usering = AuthManager2.share.userEmail
            print("使用者\(usering)登入中")
        } else {
            print("沒有使用者登入中")
        }
    }
    
    
    func configureLogoImageView() {
        logoImage.backgroundColor = .red
        logoImage.layer.masksToBounds = true
        logoImage.contentMode = .scaleAspectFill
        
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            logoImage.widthAnchor.constraint(equalToConstant: 200),
            logoImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    func configureSignInButton() {
        signInButton.layer.cornerRadius = 16
        signInButton.addTarget(self, action: #selector(didTapSignInPage), for: .touchUpInside)
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signInButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            signInButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signInButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            signInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func configureSignUpButton() {
        signUpButton.layer.cornerRadius = 25
        signUpButton.addTarget(self, action: #selector(didTapSignUpPage), for: .touchUpInside)
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.bottomAnchor.constraint(equalTo: signInButton.topAnchor, constant: -15),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
            signUpButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    @objc private func didTapSignInPage() {
        DispatchQueue.main.async {
            let vc = SignInViewController()
            //let vc = choosemainview()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
    
    @objc private func didTapSignUpPage() {
//        let vc = SignUpViewController()
        DispatchQueue.main.async {
            let vc = SignUpViewController()
            //let vc = CharacterSelectViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
    }
}
