//
//  GameModels.swift
//  GameModels
//
//  Created by 陳韋綸 on 2021/11/21.
//

import Foundation
import SpriteKit
import AVFoundation
class GameModels {
    enum skills {
        case selfAttack
        case selfHealth
        case selfNirvana
        case enemyAttack
    }
    
    enum mains {
        case bear
        case girl
    }
    
    static let models = GameModels()
    private var playerDidFinishObserver: NSObjectProtocol?
    private var play = AVPlayer()
    private var nodeVideo = SKVideoNode()
    
    func skill(view: SKView, selfPlayer: SKSpriteNode, enemyPlayer: SKSpriteNode, skill: skills, completion: @escaping (SKVideoNode) -> Void) {
        switch skill {
        case .selfAttack:
            guard let path = Bundle.main.url(forResource: "熊熊火爆", withExtension: "mov") else {
                return
            }
            play = AVPlayer(url: path)
            nodeVideo = SKVideoNode(avPlayer: play)
            nodeVideo.size = view.frame.size
            nodeVideo.position = view.center
            nodeVideo.setScale(1)
            nodeVideo.play()
            selfPlayer.zPosition = 3
            nodeVideo.zPosition = 2
            enemyPlayer.zPosition = 1
            completion(nodeVideo)
        case .selfHealth:
            guard let path = Bundle.main.url(forResource: "章魚燒庛佑", withExtension: "mov") else {
                return
            }
            play = AVPlayer(url: path)
            nodeVideo = SKVideoNode(avPlayer: play)
            nodeVideo.size = view.frame.size
            nodeVideo.setScale(1)
            nodeVideo.position = view.center
            nodeVideo.play()
            selfPlayer.zPosition = 3
            nodeVideo.zPosition = 2
            enemyPlayer.zPosition = 1
            completion(nodeVideo)
        case .selfNirvana:
            guard let path = Bundle.main.url(forResource: "地獄之火", withExtension: "mov") else {
                return
            }
            play = AVPlayer(url: path)
            nodeVideo = SKVideoNode(avPlayer: play)
            nodeVideo.size = view.frame.size
            nodeVideo.setScale(1)
            nodeVideo.position = view.center
            nodeVideo.play()
            selfPlayer.zPosition = 2
            nodeVideo.zPosition = 3
            enemyPlayer.zPosition = 1
            completion(nodeVideo)
        case .enemyAttack:
            guard let path = Bundle.main.url(forResource: "bearAttack", withExtension: "mov") else {
                return
            }
            let play = AVPlayer(url: path)
            let nodeVideo = SKVideoNode(avPlayer: play)
            nodeVideo.size = view.frame.size
            nodeVideo.xScale = -1
            nodeVideo.zRotation = .pi
            nodeVideo.setScale(1)
            nodeVideo.position = view.center
            nodeVideo.play()
            selfPlayer.zPosition = 1
            nodeVideo.zPosition = 2
            enemyPlayer.zPosition = 3
            play.replaceCurrentItem(with: nil)
            NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: play.currentItem, queue: .main) { _ in
            }
            completion(nodeVideo)
        }
    }
    
    func selfPlyer(selfHealthBarFrame: SKSpriteNode, view: SKView, main: mains, completion: (SKSpriteNode) -> Void) {
        switch main {
        case .bear:
            let selfPlayer = SKSpriteNode(imageNamed: "bearBack")
            selfPlayer.size = CGSize(width: view.width/2, height: view.height/2)
            selfPlayer.setScale(1)
            selfPlayer.position = CGPoint(x: view.width/4, y: selfHealthBarFrame.frame.maxY+selfPlayer.frame.height/2.5)
            completion(selfPlayer)
        case .girl:
            let selfPlayer = SKSpriteNode(imageNamed: "girlMain")
            selfPlayer.size = CGSize(width: view.height/2, height: view.height/2)
            selfPlayer.setScale(1)
            selfPlayer.position = CGPoint(x: view.width/4, y: selfHealthBarFrame.frame.maxY+selfPlayer.frame.height/2.5)
            completion(selfPlayer)
        }
    }
    
    func enemyPlyer(enemyHealthBarFrame: SKSpriteNode, view: SKView, main: mains, completion: (SKSpriteNode) -> Void) {
        switch main {
        case .bear:
            let enemyPlayer = SKSpriteNode(imageNamed: "bearMain")
            enemyPlayer.setScale(1)
            enemyPlayer.xScale = -1
            enemyPlayer.size = CGSize(width: view.width/2, height: view.height/2)
            enemyPlayer.position = CGPoint(x: view.right-enemyPlayer.frame.width/2.5, y: enemyHealthBarFrame.frame.maxY-enemyPlayer.frame.height/1.8)
            completion(enemyPlayer)
        case .girl:
            let enemyPlayer = SKSpriteNode(imageNamed: "girlMain")
            enemyPlayer.setScale(1)
            enemyPlayer.xScale = -1
            enemyPlayer.size = CGSize(width: view.width/2-30, height: view.height/2-50)
            enemyPlayer.position = CGPoint(x: view.right-enemyPlayer.frame.width/2+30, y: enemyHealthBarFrame.frame.minY-enemyPlayer.frame.height/2.5)
            completion(enemyPlayer)
        }
    }
}
