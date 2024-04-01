//
//  SkillContentView.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/4/1.
//

import UIKit

enum skillContentType {
    case skillOne, skilltwo, skillThree
}

class SkillContentView: UIView {
    
    let contentLabel = UILabel()
    let attackLabel = UILabel()
    let arrow = UIImageView()
    let attackPowerLabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    
    convenience init(contentType: skillContentType) {
        self.init(frame: .zero)
        addSubview(contentLabel)
        addSubview(attackLabel)
        addSubview(arrow)
        addSubview(attackPowerLabel)
        switch contentType {
        case .skillOne:
            self.contentLabel.text = "攻擊對方視線，造成暈眩效果2秒"
            self.attackLabel.text = "攻擊力 + 10 "
            self.attackPowerLabel.text = "+ 15"
        case .skilltwo:
            self.contentLabel.text = "吃了章魚燒後可以恢復自身生命"
            self.attackLabel.text = "治癒力 + 10"
            self.attackPowerLabel.text = "+ 15"
        case .skillThree:
            self.contentLabel.text = "使用地獄鬼火，造成大量傷害"
            self.attackLabel.text = "攻擊力 + 10"
            self.attackPowerLabel.text = "+ 15"
        }
        configureView()
        configureContentLabel()
        configureAttackLabel()
        configureArrowImage()
        configureAttackPowerLabel()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureView() {
        backgroundColor = #colorLiteral(red: 0.267539829, green: 0.262578547, blue: 0.2626674473, alpha: 1)
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 1
        layer.cornerRadius = 26
    }
    
    
    func configureContentLabel() {
        contentLabel.font = .systemFont(ofSize: 14, weight: .bold)
        contentLabel.textColor = .white
        contentLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contentLabel.topAnchor.constraint(equalTo: topAnchor, constant: 28),
            contentLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            contentLabel.widthAnchor.constraint(equalToConstant: 250),
            contentLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureAttackLabel() {
        attackLabel.font = .systemFont(ofSize: 14, weight: .bold)
        attackLabel.textColor = .white
        attackLabel.translatesAutoresizingMaskIntoConstraints  = false
        NSLayoutConstraint.activate([
            attackLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 3),
            attackLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            attackLabel.widthAnchor.constraint(equalToConstant: 80),
            attackLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureArrowImage() {
        arrow.image = UIImage(systemName: "arrow.right")
        arrow.tintColor = .white
        arrow.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            arrow.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 4),
            arrow.leadingAnchor.constraint(equalTo: attackLabel.trailingAnchor, constant: 3),
            arrow.widthAnchor.constraint(equalToConstant: 18),
            arrow.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    
    func configureAttackPowerLabel() {
        attackPowerLabel.font = .systemFont(ofSize: 14, weight: .bold)
        attackPowerLabel.textColor = .white
        attackPowerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            attackPowerLabel.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 3),
            attackPowerLabel.leadingAnchor.constraint(equalTo: arrow.trailingAnchor, constant: 2),
            attackPowerLabel.widthAnchor.constraint(equalToConstant: 50),
            attackPowerLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
