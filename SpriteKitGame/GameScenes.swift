//
//  GameScene.swift
//  GameScene
//
//  Created by 陳韋綸 on 2021/11/16.
//

import Foundation
import SpriteKit
import ARKit
import GPUImage

class GameScene: SKScene {
    
    private var sample = SKVideoNode(fileNamed: "fire3-2.mov")
    private var selfHealthFrame = SKSpriteNode()
    private var enemyHealthFrame = SKSpriteNode()

    var userPlayer = SKSpriteNode()
    var enemyPlayer = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        
        backgroundColor = .white
        selfHpProgressBar(width: view.width)
        enemyHpProgressBar(width: view.width)
        
        userPlayer = SKSpriteNode(imageNamed: "bearMain")
        userPlayer.size = CGSize(width: view.width/2, height: view.height/2)
        userPlayer.position = CGPoint(x: userPlayer.frame.width/2, y: selfHealthFrame.frame.maxY+userPlayer.size.height/2)
        userPlayer.setScale(1)
        addChild(userPlayer)
        
        enemyPlayer = SKSpriteNode(imageNamed: "bearMain")
        enemyPlayer.size = CGSize(width: view.width/2, height: view.height/2)
        enemyPlayer.position = CGPoint(x: view.right-enemyPlayer.frame.width/2, y: enemyHealthFrame.frame.maxY-enemyPlayer.size.height/2)
        enemyPlayer.setScale(1)
        enemyPlayer.xScale = -1
        addChild(enemyPlayer)
        
        
//        guard let bundle = Bundle.main.url(forResource: "fire3-1", withExtension: "mov") else {
//            print("no")
//            return
//        }
        
//        let FUCK = AVPlayer(url: bundle)

//        sample = SKVideoNode(avPlayer: FUCK)
        sample.position = view.center
        sample.size = CGSize(width: 250, height: 250)
        
        sample.play()
//        sample.run(SKAction.move(to: enemyPlayer.position, duration: 0.8)) {
//            self.sample.run(SKAction.fadeAlpha(to: 0, duration: 2))
//        }
        addChild(sample)
        heartAnimation(with: enemyPlayer)
        heartAnimation(with: userPlayer)
    }
    
    func selfHpProgressBar(width: CGFloat) {
        let selfHealthBar = ProgressBarNode(width: Int(width)-100)
        selfHealthFrame = SKSpriteNode(color: .clear, size: CGSize(width: width, height: 100))
        selfHealthFrame.position = CGPoint(x: 0+width/2, y: 0+50)
        
        selfHealthBar.position = CGPoint(x: 0, y: 40)
        selfHealthBar.updataProgress(0.5)
        addChild(selfHealthFrame)
        selfHealthFrame.addChild(selfHealthBar)
    }
    
    
    func enemyHpProgressBar(width: CGFloat) {
        let enemyHealthBar = ProgressBarNode(width: Int(width)-100)
        enemyHealthFrame = SKSpriteNode(color: .clear, size: CGSize(width: width, height: 100))
        enemyHealthFrame.position = CGPoint(x: 0+width/2, y: view!.bottom-100)
        
        enemyHealthBar.position = CGPoint(x: 0, y: 0)
        enemyHealthBar.updataProgress(0.5)
        addChild(enemyHealthFrame)
        enemyHealthFrame.addChild(enemyHealthBar)
        enemyHealthFrame.xScale = -1
    }
    
    func heartAnimation(with: SKSpriteNode) {
        with.run(SKAction.fadeAlpha(to: 0, duration: 0.3)) {
            with.run(SKAction.moveTo(x: with.position.x-30, duration: 0.1)) {
                with.run(SKAction.moveTo(x: with.position.x+60, duration: 0.1)) {
                    with.run(SKAction.moveTo(x: with.position.x-30, duration: 0.1))
                }
            }
            with.run(SKAction.fadeAlpha(to: 1, duration: 0.5))
        }
    }
}
