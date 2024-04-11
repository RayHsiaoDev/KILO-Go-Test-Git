//
//  SkillViewController.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2024/3/27.
//

import UIKit

class SkillViewController: UIViewController {
    
    let skillBackGroundImage = UIImageView()
    let characterImage = UIImageView()
    let skillOne = SkillOneView()
    let skillTwo = SkillTwoView()
    let skillThree = SkillThreeView()
    let skillContentOne = SkillContentView(contentType: .skillOne)
    let skillContentTwo = SkillContentView(contentType: .skilltwo)
    let skillContentThree = SkillContentView(contentType: .skillThree)
    var skillContentOneTopconstraint = NSLayoutConstraint()
    var skillContentTwoTopconstraint = NSLayoutConstraint()
    var skillContentThreeTopconstraint = NSLayoutConstraint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(skillBackGroundImage)
        view.addSubview(characterImage)
        view.addSubview(skillContentOne)
        view.addSubview(skillOne)
        view.addSubview(skillContentTwo)
        view.addSubview(skillTwo)
        view.addSubview(skillContentThree)
        view.addSubview(skillThree)
        configureSkillBackGroundImage()
        configureCharacter()
        configureSkillOne()
        configureSkillTwo()
        configureSkillThree()
        configureSkillOneContent()
        configureSkillTwoContent()
        configureSkillThreeContent()
    }
    
    
    func configureSkillBackGroundImage() {
        skillBackGroundImage.image = UIImage(named: "技能背景")
        skillBackGroundImage.frame = view.bounds
    }
    
    
    func configureCharacter() {
        characterImage.image = UIImage(named: "bearMain")
        characterImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            characterImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            characterImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -65),
            characterImage.widthAnchor.constraint(equalToConstant: 280),
            characterImage.heightAnchor.constraint(equalToConstant: 530)
        ])
    }
    
    
    func configureSkillOne() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(skillOneTap))
        skillOne.addGestureRecognizer(tap)
        
        skillOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillOne.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: -53),
            skillOne.widthAnchor.constraint(equalToConstant: 380),
            skillOne.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureSkillTwo() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(skillTwoTap))
        skillTwo.addGestureRecognizer(tap)
        
        skillTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillTwo.topAnchor.constraint(equalTo: skillContentOne.bottomAnchor, constant: 20),
            skillTwo.widthAnchor.constraint(equalToConstant: 380),
            skillTwo.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureSkillThree() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(skillThreeTap))
        skillThree.addGestureRecognizer(tap)
        
        skillThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillThree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillThree.topAnchor.constraint(equalTo: skillContentTwo.bottomAnchor, constant: 20),
            skillThree.widthAnchor.constraint(equalToConstant: 380),
            skillThree.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureSkillOneContent() {
        skillContentOne.translatesAutoresizingMaskIntoConstraints = false
        skillContentOneTopconstraint = skillContentOne.topAnchor.constraint(equalTo: skillOne.topAnchor, constant: 0)
        NSLayoutConstraint.activate([
            skillContentOneTopconstraint,
            skillContentOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillContentOne.widthAnchor.constraint(equalToConstant: 380),
            skillContentOne.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureSkillTwoContent() {
        skillContentTwo.translatesAutoresizingMaskIntoConstraints = false
        skillContentTwoTopconstraint = skillContentTwo.topAnchor.constraint(equalTo: skillTwo.topAnchor, constant: 0)
        NSLayoutConstraint.activate([
            skillContentTwoTopconstraint,
            skillContentTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillContentTwo.widthAnchor.constraint(equalToConstant: 380),
            skillContentTwo.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureSkillThreeContent() {
        skillContentThree.translatesAutoresizingMaskIntoConstraints = false
        skillContentThreeTopconstraint = skillContentThree.topAnchor.constraint(equalTo: skillThree.topAnchor, constant: 0)
        NSLayoutConstraint.activate([
            skillContentThreeTopconstraint,
            skillContentThree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillContentThree.widthAnchor.constraint(equalToConstant: 380),
            skillContentThree.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    @objc func skillOneTap() {
        if skillContentOneTopconstraint.constant == 0 {
            skillContentOneTopconstraint.constant = 58
            
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self = self else { return }
                self.view.layoutIfNeeded()
            }
        } else if skillContentOneTopconstraint.constant == 58 {
            skillContentOneTopconstraint.constant = 0
            
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self = self else { return }
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    @objc func skillTwoTap() {
        if skillContentTwoTopconstraint.constant == 0 {
            skillContentTwoTopconstraint.constant = 58
            
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self = self else { return }
                self.view.layoutIfNeeded()
            }
        } else if skillContentTwoTopconstraint.constant == 58 {
            skillContentTwoTopconstraint.constant = 0
            
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self = self else { return }
                self.view.layoutIfNeeded()
            }
        }
    }
    
    
    @objc func skillThreeTap() {
        if skillContentThreeTopconstraint.constant == 0 {
            skillContentThreeTopconstraint.constant = 58
            
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self = self else { return }
                self.view.layoutIfNeeded()
            }
        } else if skillContentThreeTopconstraint.constant == 58 {
            skillContentThreeTopconstraint.constant = 0
            
            UIView.animate(withDuration: 0.5) { [weak self] in
                guard let self = self else { return }
                self.view.layoutIfNeeded()
            }
        }
    }
}
