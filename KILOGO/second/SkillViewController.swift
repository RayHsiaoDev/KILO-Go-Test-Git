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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSkillBackGroundImage()
        configureCharacter()
        configureSkillOne()
        configureSkillTwo()
        configureSkillThree()
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
            characterImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            characterImage.widthAnchor.constraint(equalToConstant: 250),
            characterImage.heightAnchor.constraint(equalToConstant: 350)
        ])
    }
    
    
    func configureSkillOne() {
        skillOne.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillOne.topAnchor.constraint(equalTo: characterImage.bottomAnchor, constant: 20),
            skillOne.widthAnchor.constraint(equalToConstant: 350),
            skillOne.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureSkillTwo() {
        skillTwo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillTwo.topAnchor.constraint(equalTo: skillOne.bottomAnchor, constant: 20),
            skillTwo.widthAnchor.constraint(equalToConstant: 350),
            skillTwo.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureSkillThree() {
        skillThree.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillThree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillThree.topAnchor.constraint(equalTo: skillTwo.bottomAnchor, constant: 20),
            skillThree.widthAnchor.constraint(equalToConstant: 350),
            skillThree.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
}
