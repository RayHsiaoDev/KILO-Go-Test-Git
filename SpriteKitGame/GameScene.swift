//
//  GameScene.swift
//  GameScene
//
//  Created by 陳韋綸 on 2021/11/19.
//

import Foundation
import SpriteKit
import AVFoundation
import Firebase

protocol GameSceneDelegate: AnyObject {
    func gameFunc(enemyHP: CGFloat, selfHP: CGFloat)
}

class GameScene: SKScene {
    
    weak var delegates: GameSceneDelegate?
    private var victoryBackground = SKSpriteNode()
    private var background = SKSpriteNode()
    private var selfPlayer = SKSpriteNode()
    private var enemyPlayer = SKSpriteNode()
    
    private var selfHealthBarFrame = SKSpriteNode()
    private var enemyHealthBarFrame = SKSpriteNode()
    
    var selfHealthBar: ProgressBarNode?
    var enemyHealthBar: ProgressBarNode?
    
    var skill = SKVideoNode()
    
    public var selfHP: CGFloat! = 100.0
    public var enemyHP: CGFloat! = 100.0
    
    override func didMove(to view: SKView) {
        selfHealthBarFrame(FrameNode: selfHealthBarFrame, view: view)
        enemyHealthBarFrame(FrameNode: enemyHealthBarFrame, view: view)
        background = SKSpriteNode(imageNamed: "GameBackground5")
        background.size = view.frame.size
        background.position = view.center
        addChild(background)
        
        GameModels.models.selfPlyer(selfHealthBarFrame: selfHealthBarFrame, view: view, main: .bear) { [weak self] spriteNode in
            self?.selfPlayer = spriteNode
        }
        addChild(selfPlayer)
        
        GameModels.models.enemyPlyer(enemyHealthBarFrame: enemyHealthBarFrame, view: view, main: .girl) { [weak self] spriteNode in
            self?.enemyPlayer = spriteNode
        }

        addChild(enemyPlayer)
        skill.size = view.frame.size
        skill.position = view.center
    }
    
    func selfHealthBarFrame(FrameNode: SKSpriteNode, view: SKView) {
        FrameNode.size = CGSize(width: view.width, height: 100)
        FrameNode.position = CGPoint(x: view.width/2, y: 50)
        selfHealthBar = ProgressBarNode(width: Int(view.width/3*2))
        selfHealthBar?.position = CGPoint(x: -40, y: 0)
        addChild(FrameNode)
        FrameNode.addChild(selfHealthBar!)
    }
    
    func enemyHealthBarFrame(FrameNode: SKSpriteNode, view: SKView) {
        FrameNode.size = CGSize(width: view.width, height: 100)
        FrameNode.position = CGPoint(x: view.width/2, y: view.bottom-100)
        enemyHealthBar = ProgressBarNode(width: Int(view.width/3*2))
        enemyHealthBar?.position = CGPoint(x: 55, y: -15)
        addChild(FrameNode)
        FrameNode.addChild(enemyHealthBar!)
        enemyHealthBar?.xScale = -1
    }
    
    func skill(_ with: skill) {
        switch with {
        case .attack:
            GameModels.models.skill(view: self.view!, selfPlayer: selfPlayer, enemyPlayer: enemyPlayer, skill: .selfAttack) { [weak self] videos in
                self?.skill = videos
                self?.addChild(self!.skill)
                self?.enemyHP -= 20.0
                self?.enemyHealthBar?.updataProgress(self!.enemyHP/100.0)
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    videos.removeAllChildren()
                    videos.removeFromParent()
                    videos.removeAllActions()
                    self?.delegates?.gameFunc(enemyHP: (self?.enemyHP)!, selfHP: (self?.selfHP)!)
                }
            }
        case .health:
            GameModels.models.skill(view: self.view!, selfPlayer: selfPlayer, enemyPlayer: enemyPlayer, skill: .selfHealth) { [weak self] videos in
                self?.skill = videos
                self?.addChild(self!.skill)
                self?.enemyHP += 20.0
                self?.enemyHealthBar?.updataProgress(self!.enemyHP/100.0)
                DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                    videos.removeAllChildren()
                    videos.removeFromParent()
                    videos.removeAllActions()
                    self?.delegates?.gameFunc(enemyHP: (self?.enemyHP)!, selfHP: (self?.selfHP)!)
                }
            }
        case .skillerMoves:
            GameModels.models.skill(view: self.view!, selfPlayer: selfPlayer, enemyPlayer: enemyPlayer, skill: .selfNirvana) { [weak self] videos in
                self?.skill = videos
                self?.addChild(self!.skill)
                self?.enemyHP -= 50.0
                self?.enemyHealthBar?.updataProgress(self!.enemyHP/100.0)
                DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                    videos.removeAllChildren()
                    videos.removeFromParent()
                    videos.removeAllActions()
                    self?.delegates?.gameFunc(enemyHP: (self?.enemyHP)!, selfHP: (self?.selfHP)!)
                }
            }
        }
    }
}
