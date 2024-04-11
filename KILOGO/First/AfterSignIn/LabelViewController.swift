//
//  LabelViewController.swift
//  LabelViewController
//
//  Created by 陳韋綸 on 2021/12/6.
//

import UIKit

class LabelViewController: UIViewController {

    let backgroundColor = CAGradientLayer()
    let label = UILabel()
    let vc = ChooseMainViewController()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        view.layer.addSublayer(backgroundColor)
        view.addSubview(label)
        configureBackgroundColor()
        cofigureLabel()
        createDismissUIView()
        UIView.animate(withDuration: 1) {
            self.label.alpha = 1
        }
    }
    
    
    func configureBackgroundColor() {
        backgroundColor.frame = view.bounds
        backgroundColor.colors = [UIColor(red: 1, green: 0.9, blue: 0.6, alpha: 1).cgColor,
                                  UIColor(red: 0.9, green: 0.6, blue: 0.5, alpha: 1).cgColor]
    }
    
    
    func cofigureLabel() {
        label.text = "接下來我們需要您填寫個人基本資料。"
        label.numberOfLines = 2
        label.sizeToFit()
        label.font = .systemFont(ofSize: 25, weight: .semibold)
        label.textAlignment = .center
        label.textColor = .brown
        label.alpha = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: 300),
            label.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    
    func createDismissUIView() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapScreen))
        view.addGestureRecognizer(tap)
    }
    
    
    @objc func didTapScreen() {
        UIView.animate(withDuration: 1) {
            self.label.alpha = 0
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3/2) {[weak self] in
            guard let self = self else { return }
            
            self.vc.modalPresentationStyle = .fullScreen
            self.present(self.vc, animated: false)
        }
    }
}
