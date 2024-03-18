//
//  LevelSkillViewController.swift
//  LevelSkillViewController
//
//  Created by 陳韋綸 on 2021/12/20.
//

import UIKit

class LevelSkillViewController: UIViewController {
    
    private let backimage = UIImageView()
    
    private let headerView = test(frame: .zero)
    
    private let bear = LevelSkillPageMain(type: .bear)
    private let skill1Section = LevelSkill1PageModels(type: .bear)
    private let skill1Cell = LevelSkill1PageModelsCell(type: .bear)
    private let skill2Section = LevelSkill2PageModels(type: .bear)
    private let skill2Cell = LevelSkill2PageModelsCell(type: .bear)
    private let skill3Section = LevelSkill3PageModels(type: .bear)
    private let skill3Cell = LevelSkill3PageModelsCell(type: .bear)
    var bool1: Bool = false
    var bool2: Bool = false
    var bool3: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setHidesBackButton(true, animated: false)
        view.backgroundColor = .white
        backimage.image = UIImage(named: "技能背景")
        view.addSubview(backimage)
        view.addSubview(bear)
        view.addSubview(headerView)
        view.addSubview(skill1Cell)
        view.addSubview(skill1Section)
        view.addSubview(skill2Cell)
        view.addSubview(skill2Section)
        view.addSubview(skill3Cell)
        view.addSubview(skill3Section)
        headerView.frame = CGRect(x: 0, y: 0, width: view.width, height: 80)
        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        headerView.layer.cornerRadius = 30
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSkill1))
        skill1Section.addGestureRecognizer(tap)
        skill1Cell.isHidden = true
        let tap1 = UITapGestureRecognizer(target: self, action: #selector(didTapSkill2))
        skill2Section.addGestureRecognizer(tap1)
        skill2Cell.isHidden = true
        let tap2 = UITapGestureRecognizer(target: self, action: #selector(didTapSkill3))
        skill3Section.addGestureRecognizer(tap2)
        skill3Cell.isHidden = true
    }
    
    @objc func didTapSkill1() {
        if bool1 {
            skill1Cell.isHidden = false
            skill2Cell.isHidden = true
            skill3Cell.isHidden = true
            skill2Section.frame.origin.y = skill1Cell.bottom + 10
            skill2Cell.frame.origin.y = skill1Cell.bottom + 10
            skill3Section.frame.origin.y = skill2Section.bottom + 10
            skill3Cell.frame.origin.y = skill2Section.bottom + 10
        } else {
            skill1Cell.isHidden = true
            skill2Cell.isHidden = true
            skill3Cell.isHidden = true
            skill2Section.frame.origin.y = skill1Section.bottom + 10
            skill2Cell.frame.origin.y = skill1Section.bottom + 10
            skill3Section.frame.origin.y = skill2Section.bottom + 10
            skill3Cell.frame.origin.y = skill2Section.bottom + 10
        }
        bool1 = !bool1
    }
    
    @objc func didTapSkill2() {
        if bool2 {
            skill1Cell.isHidden = true
            skill2Cell.isHidden = false
            skill3Cell.isHidden = true
            skill2Section.frame.origin.y = skill1Section.bottom + 10
            skill2Cell.frame.origin.y = skill1Section.bottom + 10
            skill3Section.frame.origin.y = skill2Cell.bottom + 10
            skill3Cell.frame.origin.y = skill2Cell.bottom + 10
        }
        else {
            skill1Cell.isHidden = true
            skill2Cell.isHidden = true
            skill3Cell.isHidden = true
            skill2Section.frame.origin.y = skill1Section.bottom + 10
            skill2Cell.frame.origin.y = skill1Section.bottom + 10
            skill3Section.frame.origin.y = skill2Section.bottom + 10
            skill3Cell.frame.origin.y = skill2Section.bottom + 10
        }
        bool2 = !bool2
    }
    
    @objc func didTapSkill3() {
        if bool3 {
            skill1Cell.isHidden = true
            skill2Cell.isHidden = true
            skill3Cell.isHidden = false
            skill2Section.frame.origin.y = skill1Section.bottom + 10
            skill2Cell.frame.origin.y = skill1Section.bottom + 10
            skill3Section.frame.origin.y = skill2Section.bottom + 10
            skill3Cell.frame.origin.y = skill2Section.bottom + 10
        }
        else {
            skill1Cell.isHidden = true
            skill2Cell.isHidden = true
            skill3Cell.isHidden = true
            skill2Section.frame.origin.y = skill1Section.bottom + 10
            skill2Cell.frame.origin.y = skill1Section.bottom + 10
            skill3Section.frame.origin.y = skill2Section.bottom + 10
            skill3Cell.frame.origin.y = skill2Section.bottom + 10
        }
        bool3 = !bool3
    }
    
    func layout() {
        skill1Section.frame = CGRect(x: 20, y: bear.bottom-30, width: view.width-40, height: 80)
        skill1Cell.frame = CGRect(x: 20, y: bear.bottom-30, width: view.width-40, height: 140)
        skill1Section.layer.cornerRadius = skill1Section.height/3
        skill1Cell.layer.cornerRadius = skill1Section.height/3
        skill2Section.frame = CGRect(x: 20, y: skill1Section.bottom+10, width: view.width-40, height: 80)
        skill2Cell.frame = CGRect(x: 20, y: skill1Section.bottom+10, width: view.width-40, height: 140)
        skill2Section.layer.cornerRadius = skill2Section.height/3
        skill2Cell.layer.cornerRadius = skill2Section.height/3
        skill3Section.frame = CGRect(x: 20, y: skill2Section.bottom+10, width: view.width-40, height: 80)
        skill3Cell.frame = CGRect(x: 20, y: skill2Section.bottom+10, width: view.width-40, height: 140)
        skill3Section.layer.cornerRadius = skill3Section.height/3
        skill3Cell.layer.cornerRadius = skill3Section.height/3
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backimage.frame = view.bounds
        bear.frame = CGRect(x: 0, y: headerView.bottom, width: view.width, height: view.height/2)
        layout()
    }
}


//@objc func didTapSkill1() {
//    if bool1 {
//        skill2Section.frame.origin.y = skill1Cell.bottom+10
//        skill2Cell.frame.origin.y = skill1Cell.bottom+10
//        if !skill2Cell.isHidden {
//            skill3Section.frame.origin.y = skill2Cell.bottom+10
//            skill3Cell.frame.origin.y = skill2Cell.bottom+10
//        }
//        else {
//        skill3Section.frame.origin.y = skill2Section.bottom+10
//        skill3Cell.frame.origin.y = skill2Section.bottom+10
//        }
//        skill1Cell.isHidden = false
//    }
//    else {
//        skill2Section.frame.origin.y = skill1Section.bottom+10
//        skill2Cell.frame.origin.y = skill1Section.bottom+10
//        if !skill2Cell.isHidden {
//            skill3Section.frame.origin.y = skill2Cell.bottom+10
//            skill3Cell.frame.origin.y = skill2Cell.bottom+10
//        }
//        else {
//        skill3Section.frame.origin.y = skill2Section.bottom+10
//        skill3Cell.frame.origin.y = skill2Section.bottom+10
//        }
//        skill1Cell.isHidden = true
//    }
//    bool1 = !bool1
//}
//
//@objc func didTapSkill2() {
//    if bool2 {
//        skill3Section.frame.origin.y = skill2Cell.bottom+10
//        skill3Cell.frame.origin.y = skill2Cell.bottom+10
//        skill2Cell.isHidden = false
//    }
//    else {
//        skill3Section.frame.origin.y = skill2Section.bottom+10
//        skill3Cell.frame.origin.y = skill2Section.bottom+10
//        skill2Cell.isHidden = true
//    }
//    bool2 = !bool2
//}
//
//@objc func didTapSkill3() {
//    if bool3 {
//        skill3Cell.isHidden = false
//    }
//    else {
//        skill3Cell.isHidden = true
//    }
//    bool3 = !bool3
//}
