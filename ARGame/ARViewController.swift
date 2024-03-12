//
//  ViewController.swift
//  arar
//
//  Created by 陳韋綸 on 2021/8/9.
//

import UIKit
import SpriteKit
import ARKit
import Firebase
import SDWebImage
import AVFoundation

enum skill {
    case attack
    case health
    case skillerMoves
}

enum skillName {
    case attack
    case health
    case nirvana
}

protocol ARViewControllerDelegate: AnyObject {
    func aRViewController(_ skill: skill)
}

class ARViewController: UIViewController, ARSessionDelegate ,ARSKViewDelegate,ARSCNViewDelegate {
    
    weak var delegate: ARViewControllerDelegate?
    
    var arView = ARSKView()
    
    var leftX: CGFloat = 0.0
    var leftY: CGFloat = 0.0
    var rightX: CGFloat = 0.0
    var rightY: CGFloat = 0.0
    var HeadX: CGFloat = 0.0
    var HeadY: CGFloat = 0.0
    
    var leftButtonX: CGFloat = 0
    var leftButtonY: CGFloat = 0
    var rightButtonX: CGFloat = 0
    var rightButtonY: CGFloat = 0
    
    let startConditionBackRound = ARImageView(type: .background)
    let attackSkillImage = ARImageView(type: .attack)
    let healthSkillImage = ARImageView(type: .health)
    let killerMovesSkillImage = ARImageView(type: .nirvana)
    let leftButton = ARImageView(type: .leftButton)
    let rightButton = ARImageView(type: .rightButton)
    
    var listBackground = UIImageView()
    var leftList = CAShapeLayer()
    var rightList = CAShapeLayer()
    
    var headPointDoor = true
    var handPointDoor = false
    var skillDoor = true
    var attackButtonDoor = false
    var healthButtonDoor = false
    var killerMovesButtonDoor = false
    var score = 0

    static let stop = [0,0,0,0]
    var attackBubbleArray = [[140, -10, 80, -10],
                             [140, -10, 80, -10],
                             [140, -10, 80, -10],
                             [140, -10, 80, -10],
                             [140, -10, 80, -10],
                                stop]
    
    var healthBubbleArray = [[-50, 150, 300, 150],
                             [50, 550, 150, 550],
                             [80, 70, 180, 70],
                             [200, 550, 300, 550],
                             stop]
    
    var killerMovesBubbleArray = [[50, 150, 200, 150],
                                  [235, 550, -500, -500],
                                  [15, 120, 300, 300],
                                  [235, 550, -500, -500],
                                  [50, 150, 200, 150],
                                  [235, 550, -500, -500],
                                  [15, 120, 300, 300],
                                  [235, 550, -500, -500],
                                  stop]

    let scoreLabel: UILabel = {
        let label = UILabel()
        label.transform = CGAffineTransform(scaleX: -1, y: 1)
        label.font = label.font.withSize(30)
        label.textAlignment = .center
        label.textColor = .white
        label.sizeToFit()
        label.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        label.layer.masksToBounds = true
        return label
    }()
    
    let imageView = ARImageView(type: .background)
    let lefts = ARImageView(type: .normal)
    let rights = ARImageView(type: .normal)
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()
        defer {
            if let scence = SKScene(fileNamed: "SKScene") {
                arView.presentScene(scence)
            }
        }
        
        arView.session.delegate = self
        
        arView.frame = view.bounds
        
        self.view = arView
        
        arView.transform = CGAffineTransform(scaleX: -1, y: 1)
        arView.addSubview(imageView)
    }
    
    func attackButtonPoint() {
        DispatchQueue.global(qos: .default).async {
            for i in 0...self.attackBubbleArray.count - 1 {
                do {
                    if i == self.attackBubbleArray.count - 1 {
                        DispatchQueue.main.async {
                            self.delegate?.aRViewController(.attack)
                            self.dismiss(animated: true, completion: nil)
                            self.score = 0
                            self.skillDoor = true
                            self.leftButton.isHidden = true
                            self.rightButton.isHidden = true
                        }
                        break
                    }
                }
                DispatchQueue.main.async {
                    self.leftButton.alpha = 1
                    self.leftButton.frame = CGRect(x: self.attackBubbleArray[i][0], y: self.attackBubbleArray[i][1], width: 200, height: 200)
                    self.rightButton.alpha = 1
                    self.rightButton.frame = CGRect(x: self.attackBubbleArray[i][2], y: self.attackBubbleArray[i][3], width: 200, height: 200)
                    self.leftButtonX = CGFloat(self.attackBubbleArray[i][0])
                    self.leftButtonY = CGFloat(self.attackBubbleArray[i][1])
                    self.rightButtonX = CGFloat(self.attackBubbleArray[i][2])
                    self.rightButtonY = CGFloat(self.attackBubbleArray[i][3])
                    self.attackButtonDoor = true
                }
                sleep(3)
            }
        }
    }
    
    func healthButtonPoint() {
        DispatchQueue.global(qos: .default).async {
            for i in 0...self.healthBubbleArray.count - 1 {
                do {
                    if i == self.healthBubbleArray.count - 1 {
                        DispatchQueue.main.async {
                            self.delegate?.aRViewController(.health)
                            self.dismiss(animated: true, completion: nil)
                            self.score = 0
                            self.skillDoor = true
                            self.leftButton.isHidden = true
                            self.rightButton.isHidden = true
                        }
                        break
                    }
                }
                DispatchQueue.main.async {
                    self.leftButton.alpha = 1
                    self.leftButton.frame = CGRect(x: self.healthBubbleArray[i][0], y: self.healthBubbleArray[i][1], width: 200, height: 200)
                    self.rightButton.alpha = 1
                    self.rightButton.frame = CGRect(x: self.healthBubbleArray[i][2], y: self.healthBubbleArray[i][3], width: 200, height: 200)
                    self.leftButtonX = CGFloat(self.healthBubbleArray[i][0])
                    self.leftButtonY = CGFloat(self.healthBubbleArray[i][1])
                    self.rightButtonX = CGFloat(self.healthBubbleArray[i][2])
                    self.rightButtonY = CGFloat(self.healthBubbleArray[i][3])
                    self.healthButtonDoor = true
                }
                sleep(2)
            }
        }
    }
    
    func killerMovesButtonPoint() {
        DispatchQueue.global(qos: .default).async {
            for i in 0...self.killerMovesBubbleArray.count - 1 {
                do {
                    if i == self.killerMovesBubbleArray.count - 1 {
                        DispatchQueue.main.async {
                            self.delegate?.aRViewController(.skillerMoves)
                            self.dismiss(animated: true, completion: nil)
                            self.score = 0
                            self.skillDoor = true
                            self.leftButton.isHidden = true
                            self.rightButton.isHidden = true
                        }
                        break
                    }
                }
                DispatchQueue.main.async {
                    self.leftButton.alpha = 1
                    self.leftButton.frame = CGRect(x: self.killerMovesBubbleArray[i][0], y: self.killerMovesBubbleArray[i][1], width: 200, height: 200)
                    self.rightButton.alpha = 1
                    self.rightButton.frame = CGRect(x: self.killerMovesBubbleArray[i][2], y: self.killerMovesBubbleArray[i][3], width: 200, height: 200)
                    self.leftButtonX = CGFloat(self.killerMovesBubbleArray[i][0])
                    self.leftButtonY = CGFloat(self.killerMovesBubbleArray[i][1])
                    self.rightButtonX = CGFloat(self.killerMovesBubbleArray[i][2])
                    self.rightButtonY = CGFloat(self.killerMovesBubbleArray[i][3])
                    self.killerMovesButtonDoor = true
                }
                sleep(2)
            }
        }
    }
    
    func UISubviews() {
        arView.addSubview(startConditionBackRound)
        arView.addSubview(scoreLabel)
        arView.addSubview(attackSkillImage)
        arView.addSubview(healthSkillImage)
        arView.addSubview(killerMovesSkillImage)
        arView.addSubview(leftButton)
        arView.addSubview(rightButton)
        attackSkillImage.alpha = 1
        healthSkillImage.alpha = 1
        killerMovesSkillImage.alpha = 1
        attackSkillImage.transform = CGAffineTransform(scaleX: -1, y: 1)
        healthSkillImage.transform = CGAffineTransform(scaleX: -1, y: 1)
        killerMovesSkillImage.transform = CGAffineTransform(scaleX: -1, y: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        leftButton.removeFromSuperview()
        rightButton.removeFromSuperview()
        DispatchQueue.main.async {
            let configuration = ARBodyTrackingConfiguration()
            configuration.frameSemantics.insert(.bodyDetection)
            self.arView.session.run(configuration)
        }
        scoreLabel.text = "得分"
        UISubviews()
        guard let url = Bundle.main.url(forResource: "touchPointMusic", withExtension: "mp3") else {
            return
        }
        player = AVPlayer(url: url)
        player?.volume = 10
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds
        lefts.frame = CGRect(x: 0, y: arView.center.y, width: 100, height: 100)
        rights.frame = CGRect(x: arView.right-100, y: arView.center.y, width: 100, height: 100)
        lefts.layer.cornerRadius = lefts.height/2
        rights.layer.cornerRadius = rights.height/2
    }
    
    private func functions() {
        let selfWidth = view.width/3
        attackSkillImage.frame = CGRect(x: 0, y: 100, width: selfWidth, height: selfWidth)
        healthSkillImage.frame = CGRect(x: attackSkillImage.right, y: 100, width: selfWidth, height: selfWidth)
        killerMovesSkillImage.frame = CGRect(x: healthSkillImage.right, y: 100, width: selfWidth, height: selfWidth)
        let scoreLabelSize: CGFloat = 100
        scoreLabel.frame = CGRect(origin: CGPoint(x: view.left, y: 0+view.safeAreaInsets.top), size: CGSize(width: scoreLabelSize, height: scoreLabelSize-50))
        scoreLabel.layer.cornerRadius = scoreLabel.height/2
    }
    
    func session(_ session: ARSession, didUpdate frame: ARFrame) {
        BodyTrackingConfiguration.models.bodytracking(frame: frame, arView: arView) { [weak self] body in
            DispatchQueue.main.async {
                self?.leftX = body.leftHand.x
                self?.leftY = body.leftHand.y
                self?.rightX = body.rightHand.x
                self?.rightY = body.rightHand.y
                self?.HeadX = body.header.x
                self?.HeadY = body.header.y-50
            }
        }
        // 偵測
        if headPointDoor {
            if HeadY > arView.center.y-300, 50 < leftX, rightX < arView.right-50  {
                arView.addSubview(lefts)
                arView.addSubview(rights)
                handPointDoor = true
                if handPointDoor {
                    if rights.frame.minX < rightX, rightX < rights.frame.maxX, rights.frame.minY < rightY, rightY < rights.frame.maxY,
                       lefts.frame.minX < leftX, leftX < lefts.frame.maxX, lefts.frame.minY < leftY, leftY < lefts.frame.maxY {
                        imageView.removeFromSuperview()
                        lefts.removeFromSuperview()
                        rights.removeFromSuperview()
                        functions()
                        handPointDoor = false
                        headPointDoor = false
                    }
                }
            }
        }
        // attackfunc
        if skillDoor {
            if attackSkillImage.frame.minX < HeadX, HeadX < attackSkillImage.frame.maxX, attackSkillImage.frame.minY < HeadY, HeadY < attackSkillImage.frame.maxY {
                print("攻擊")
                scoreLabel.text = "\(score)/\(attackBubbleArray.count - 1)"
                UIView.animate(withDuration: 1) {
                    self.attackSkillImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                } completion: { success in
                    if success {
                        UIView.animate(withDuration: 1) {
                            self.attackSkillImage.alpha = 0
                        } completion: { success in
                            if success {
                                self.healthSkillImage.removeFromSuperview()
                                self.killerMovesSkillImage.removeFromSuperview()
                                self.attackSkillImage.removeFromSuperview()
                            }
                        }
                    }
                }
                leftButton.isHidden = false
                rightButton.isHidden = false
                skillDoor = false
                attackButtonPoint()
            }
            else if healthSkillImage.frame.minX < HeadX, HeadX < healthSkillImage.frame.maxX, healthSkillImage.frame.minY < HeadY, HeadY < healthSkillImage.frame.maxY {
                print("治癒")
                scoreLabel.text = "\(score)/\(healthBubbleArray.count - 1)"
                UIView.animate(withDuration: 1) {
                    self.healthSkillImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                } completion: { success in
                    if success {
                        UIView.animate(withDuration: 1) {
                            self.healthSkillImage.alpha = 0
                        } completion: { success in
                            if success {
                                self.healthSkillImage.removeFromSuperview()
                                self.killerMovesSkillImage.removeFromSuperview()
                                self.attackSkillImage.removeFromSuperview()
                            }
                        }
                    }
                }
                leftButton.isHidden = false
                rightButton.isHidden = false
                skillDoor = false
                healthButtonPoint()
            }
            else if killerMovesSkillImage.frame.minX < HeadX, HeadX < killerMovesSkillImage.frame.maxX, killerMovesSkillImage.frame.minY < HeadY, HeadY < killerMovesSkillImage.frame.maxY {
                print("大招")
                scoreLabel.text = "\(score)/\(killerMovesBubbleArray.count - 1)"
                UIView.animate(withDuration: 1) {
                    self.killerMovesSkillImage.transform = CGAffineTransform(scaleX: 1, y: 1)
                } completion: { success in
                    if success {
                        UIView.animate(withDuration: 1) {
                            self.killerMovesSkillImage.alpha = 0
                        } completion: { success in
                            if success {
                                self.healthSkillImage.removeFromSuperview()
                                self.killerMovesSkillImage.removeFromSuperview()
                                self.attackSkillImage.removeFromSuperview()
                            }
                        }
                    }
                }
                leftButton.isHidden = false
                rightButton.isHidden = false
                skillDoor = false
                killerMovesButtonPoint()
            }
        }
        
        if attackButtonDoor {
            if leftButtonX - 150 < leftX, leftX < leftButtonX + 150,
               leftButtonY - 150 < leftY, leftY < leftButtonY + 150,
               rightButtonX - 150 < rightX, rightX < rightButtonX + 150,
               rightButtonY - 150 < rightY, rightY < rightButtonY + 150 {
                player?.play()
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
                    self.player?.seek(to: .zero)
                }
                UIView.animate(withDuration: 1) {
                    self.leftButton.alpha = 0
                    self.rightButton.alpha = 0
                }
                self.score += 1
                scoreLabel.text = "\(score)/\(attackBubbleArray.count - 1)"
                self.attackButtonDoor = false
            }
        }
        
        if healthButtonDoor {
            if leftButtonX - 150 < leftX, leftX < leftButtonX + 150,
               leftButtonY - 150 < leftY, leftY < leftButtonY + 150,
               rightButtonX - 150 < rightX, rightX < rightButtonX + 150,
               rightButtonY - 150 < rightY, rightY < rightButtonY + 150 {
                player?.play()
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
                    self.player?.seek(to: .zero)
                }
                UIView.animate(withDuration: 1) {
                    self.leftButton.alpha = 0
                    self.rightButton.alpha = 0
                }
                self.score += 1
                scoreLabel.text = "\(score)/\(healthBubbleArray.count - 1)"
                healthButtonDoor = false
            }
        }
        
        if killerMovesButtonDoor {
            if leftButtonX - 150 < leftX, leftX < leftButtonX + 150,
               leftButtonY - 150 < leftY, leftY < leftButtonY + 150,
               rightButtonX - 150 < rightX, rightX < rightButtonX + 150,
               rightButtonY - 150 < rightY, rightY < rightButtonY + 150 {
                player?.play()
                NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player?.currentItem, queue: .main) { _ in
                    self.player?.seek(to: .zero)
                }
                UIView.animate(withDuration: 1) {
                    self.leftButton.alpha = 0
                    self.rightButton.alpha = 0
                }
                self.score += 1
                scoreLabel.text = "\(score)/\(killerMovesBubbleArray.count - 1)"
                killerMovesButtonDoor = false
            }
        }
        ClearCircleLayers()
    }
    
    private func ClearCircleLayers() {
        arView.layer.sublayers?.compactMap { $0 as? CAShapeLayer }.forEach { $0.removeFromSuperlayer() }
    }
}


