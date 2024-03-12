//
//  ChooseMainViewController.swift
//  ChooseMainViewController
//
//  Created by 陳韋綸 on 2021/12/6.
//

import UIKit
import Firebase

protocol ChooseMainViewControllerDelegate: AnyObject {
    func didTapConFirm()
}

enum MainCharacter {
    case bear
    case girl
    case boy
}

enum Symbol {
    case plus
    case minus
}

class ChooseMainViewController: UIViewController, UICollectionViewDataSource {
    
    let backgroundColor = CAGradientLayer()
    let mainInformationButton = UIButton()
    let titleLabel = UILabel()
    let nextButton = AuthButton(buttontype: .Confirm)
    var characterCollectionView: UICollectionView!
    let layout = FlowLayout()
    var character = 0
    let characterImage = ["bearMain", "boyMain", "girlMain"]
    let characterName = ["熊之介", "薩爾", "克拉拉"]
    weak var delegate: ChooseMainViewControllerDelegate!
    
    var type: MainCharacter!
    var mainInformationLabel = ChooseMainPageMainInfo(type: .bear)
    var attackSkillImage = ChooseMainSkill(type: .bearAttack)
    var healthSkillImage = ChooseMainSkill(type: .bearHealth)
    var killerSkillImage = ChooseMainSkill(type: .bearkiller)
    var skillLabel = ChooseMainSkillIntroduce(type: .bearAttack)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviewUI()
        configureBackgroundColor()
        configureStoryButton()
        configureStoryLabel()
        configureTitleLabel()
        configureCollectionView()
        configureHealthImage()
        configureAttackImage()
        configureKillerImage()
        configureSkillLabel()
        configureConfirmButton()
    }
    
    
    private func addSubviewUI() {
        view.layer.addSublayer(backgroundColor)
        view.addSubview(titleLabel)
        view.addSubview(mainInformationButton)
        view.addSubview(attackSkillImage)
        view.addSubview(healthSkillImage)
        view.addSubview(killerSkillImage)
        view.addSubview(skillLabel)
        view.addSubview(nextButton)
        view.addSubview(mainInformationLabel)
        mainInformationLabel.layer.zPosition = 1
    }
    
    
    func configureBackgroundColor() {
        backgroundColor.frame = view.bounds
        backgroundColor.colors = [UIColor(red: 1, green: 0.9, blue: 0.6, alpha: 1).cgColor,
                                  UIColor(red: 0.9, green: 0.6, blue: 0.5, alpha: 1).cgColor]
    }
    
    
    func configureStoryButton() {
        mainInformationButton.addTarget(self, action: #selector(didTapMainInfo), for: .touchUpInside)
        let image = UIImage(named: "book")?.withTintColor(.brown, renderingMode: .alwaysOriginal)
        mainInformationButton.setImage(image, for: .normal)
        
        mainInformationButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainInformationButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            mainInformationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            mainInformationButton.widthAnchor.constraint(equalToConstant: 40),
            mainInformationButton.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    
    func configureStoryLabel() {
        mainInformationLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainInformationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainInformationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            mainInformationLabel.widthAnchor.constraint(equalToConstant: 400),
            mainInformationLabel.heightAnchor.constraint(equalToConstant: 380)
        ])
    }
    
    
    func configureTitleLabel() {
        titleLabel.text = "選擇角色"
        titleLabel.textColor = .brown
        titleLabel.textAlignment = . center
        titleLabel.font = .systemFont(ofSize: 30, weight: .semibold)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5),
            titleLabel.widthAnchor.constraint(equalToConstant: view.width),
            titleLabel.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureHealthImage() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapHealthSkillLabel))
        healthSkillImage.addGestureRecognizer(tap)
        
        healthSkillImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            healthSkillImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            healthSkillImage.topAnchor.constraint(equalTo: characterCollectionView.bottomAnchor, constant: 5),
            healthSkillImage.widthAnchor.constraint(equalToConstant: 143),
            healthSkillImage.heightAnchor.constraint(equalToConstant: 143)
        ])
    }
    
    
    func configureAttackImage() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapAttackSkillLabel))
        attackSkillImage.addGestureRecognizer(tap)
        
        attackSkillImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            attackSkillImage.topAnchor.constraint(equalTo: characterCollectionView.bottomAnchor, constant: 5),
            attackSkillImage.trailingAnchor.constraint(equalTo: healthSkillImage.leadingAnchor, constant: -6),
            attackSkillImage.widthAnchor.constraint(equalToConstant: 143),
            attackSkillImage.heightAnchor.constraint(equalToConstant: 143)
            
        ])
    }
    
    
    func configureKillerImage() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapKillerSkillLabel))
        killerSkillImage.addGestureRecognizer(tap)
        
        killerSkillImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            killerSkillImage.topAnchor.constraint(equalTo: characterCollectionView.bottomAnchor, constant: 5),
            killerSkillImage.leadingAnchor.constraint(equalTo: healthSkillImage.trailingAnchor, constant: 6),
            killerSkillImage.widthAnchor.constraint(equalToConstant: 143),
            killerSkillImage.heightAnchor.constraint(equalToConstant: 143)
        ])
    }
    
    
    func configureSkillLabel() {
        skillLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            skillLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            skillLabel.topAnchor.constraint(equalTo: healthSkillImage.bottomAnchor),
            skillLabel.widthAnchor.constraint(equalToConstant: 388),
            skillLabel.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    
    func configureConfirmButton() {
        nextButton.layer.cornerRadius = 16
        nextButton.addTarget(self, action: #selector(didTapGoToHome), for: .touchUpInside)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nextButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nextButton.topAnchor.constraint(equalTo: healthSkillImage.bottomAnchor, constant: 170),
            nextButton.widthAnchor.constraint(equalToConstant: 348),
            nextButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "character", for: indexPath) as! CharacterCell
        cell.backgroundColor = .clear
        cell.shadow.image = UIImage(named: "shadow")
        cell.characterImage.image = UIImage(named: characterImage[indexPath.item])
        cell.characterLabel.text = characterName[indexPath.item]
    
        return cell
    }

    
    func configureCollectionView() {
        layout.itemSize = CGSize(width: 288, height: 463)
        layout.scrollDirection = .horizontal
        print("目前是選項＝\(layout.currentPage)")
        
        characterCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        characterCollectionView.register(CharacterCell.self, forCellWithReuseIdentifier: "character")
        characterCollectionView.dataSource = self
        characterCollectionView.delegate = self
        characterCollectionView.backgroundColor = .clear
        characterCollectionView.decelerationRate = .fast
        view.addSubview(characterCollectionView)
        
        characterCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           characterCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
           characterCollectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: -75),
           characterCollectionView.widthAnchor.constraint(equalToConstant: 288),
           characterCollectionView.heightAnchor.constraint(equalToConstant: 463)
        ])
        
    }
    
    
    func changStory() {
        if type == .bear {
            print("我選到熊的嘍")
            mainInformationLabel.removeFromSuperview()
            mainInformationLabel = ChooseMainPageMainInfo(type: .bear)
            view.addSubview(mainInformationLabel)
            mainInformationLabel.layer.zPosition = 1
            configureStoryLabel()
        } else if type == .boy {
            print("我選到男的嘍")
            mainInformationLabel.removeFromSuperview()
            mainInformationLabel = ChooseMainPageMainInfo(type: .boy)
            view.addSubview(mainInformationLabel)
            mainInformationLabel.layer.zPosition = 1
            configureStoryLabel()
          
        } else if type == .girl {
            print("我選到女的嘍")
            mainInformationLabel.removeFromSuperview()
            mainInformationLabel = ChooseMainPageMainInfo(type: .girl)
            view.addSubview(mainInformationLabel)
            mainInformationLabel.layer.zPosition = 1
            configureStoryLabel()
        }
    }
    
    
    @objc private func didTapMainInfo() {
        UIView.animate(withDuration: 1) {
            self.mainInformationLabel.alpha = 1
        }
    }
    
    
    @objc private func didTapGoToHome() {
        delegate.didTapConFirm()
        self.view.window?.rootViewController = TabBarViewController()
    }
    
    
    @objc func didTapAttackSkillLabel() {
        if type == .bear {
            skillLabel = ChooseMainSkillIntroduce(type: .bearAttack)
        }
                
        skillLabel.removeFromSuperview()
        skillLabel.alpha = 0
        view.addSubview(skillLabel)
        configureSkillLabel()
        attackSkillImage.alpha = 1
        healthSkillImage.alpha = 0.5
        killerSkillImage.alpha = 0.5
        UIView.animate(withDuration: 1) {
            self.skillLabel.alpha = 1
        }
    }
    
    
    @objc func didTapHealthSkillLabel() {
        if type == .bear {
            skillLabel = ChooseMainSkillIntroduce(type: .bearHealth)
        }
        else if type == .girl {
            
        }
        skillLabel.removeFromSuperview()
        skillLabel.alpha = 0
        view.addSubview(skillLabel)
        configureSkillLabel()
        attackSkillImage.alpha = 0.5
        healthSkillImage.alpha = 1
        killerSkillImage.alpha = 0.5
        UIView.animate(withDuration: 1) {
            self.skillLabel.alpha = 1
        }
    }
    
    
    @objc func didTapKillerSkillLabel() {
        if type == .bear {
            skillLabel = ChooseMainSkillIntroduce(type: .bearKiller)
        }
        else if type == .girl {
            
        }
        skillLabel.removeFromSuperview()
        skillLabel.alpha = 0
        view.addSubview(skillLabel)
        configureSkillLabel()
        attackSkillImage.alpha = 0.5
        healthSkillImage.alpha = 0.5
        killerSkillImage.alpha = 1
        UIView.animate(withDuration: 1) {
            self.skillLabel.alpha = 1
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 1) {
            self.mainInformationLabel.alpha = 0
        }
    }
}


extension ChooseMainViewController: UICollectionViewDelegate {
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if decelerate {
            print("目前是\(layout.currentPage)頁喔！！！！！")
            let page = layout.currentPage
            
            if page == 0 {
                type = .bear
            } else if page == 1 {
                type = .boy
            } else if page == 2 {
                type = .girl
            }
            changStory()
            
            print("目前是\(type)頁喔！！！！！")
        }
    }
}

