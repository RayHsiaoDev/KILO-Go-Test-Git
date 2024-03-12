//
//  GameViewController.swift
//  GameViewController
//
//  Created by 陳韋綸 on 2021/11/16.
//

import UIKit
import SpriteKit
import Firebase
import AVFoundation

class GameViewController: UIViewController, ARViewControllerDelegate, GameSceneDelegate {

    var timer: Timer?
    var GameTime: Timer?
    var time: Int = 0
    var vc = ARViewController()
    var resultVC = ResultsViewController()
    var sceneView = SKView()
    var scene = GameScene()
    var door: Bool = true
    var player: AVPlayer?
    override func viewDidLoad() {
        super.viewDidLoad()

//        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(isTime), userInfo: nil, repeats: false)
//        GameTime = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(GameTimeFun), userInfo: nil, repeats: true)
        guard let url = Bundle.main.url(forResource: "遊戲音樂", withExtension: "mp3") else {
            return
        }
        player = AVPlayer(url: url)
        player?.play()
        vc.delegate = self
        sceneView = SKView(frame: view.frame)
        scene = GameScene(size: sceneView.frame.size)
        view.addSubview(sceneView)
        sceneView.presentScene(scene)
        scene.delegates = self
        DispatchQueue.main.asyncAfter(deadline: .now()+3) {
            self.vc.modalPresentationStyle = .fullScreen
            self.present(self.vc, animated: true, completion: nil)
        }
    }
    
    @objc func isTime() {

    }
    
    @objc func GameTimeFun() {
        time += 1
    }
    
    func aRViewController(_ with: skill) {

            switch with {
            case .attack:
                scene.skill(.attack)
                DispatchQueue.main.asyncAfter(deadline: .now()+3) {
                    if self.door {
                        self.present(self.vc, animated: true, completion: nil)
                    }
                    else {
                        self.player?.pause()
                        self.resultVC.modalPresentationStyle = .fullScreen
                        self.present(self.resultVC, animated: true, completion: nil)
                    }
                }
            case .health:
                scene.skill(.health)
                DispatchQueue.main.asyncAfter(deadline: .now()+5) {
                    if self.door {
                        self.present(self.vc, animated: true, completion: nil)
                    }
                    else {
                        self.player?.pause()
                        self.resultVC.modalPresentationStyle = .fullScreen
                        self.present(self.resultVC, animated: true, completion: nil)
                    }
                }
            case .skillerMoves:
                scene.skill(.skillerMoves)
                DispatchQueue.main.asyncAfter(deadline: .now()+8) {
                    if self.door {
                        self.present(self.vc, animated: true, completion: nil)
                    }
                    else {
                        self.player?.pause()
                        self.resultVC.modalPresentationStyle = .fullScreen
                        self.present(self.resultVC, animated: true, completion: nil)
                    }
                }
            }
    }
    
    func gameFunc(enemyHP: CGFloat, selfHP: CGFloat) {
        if enemyHP < 0.1 {
            door = false
            print("贏")
        }
        if selfHP < 0.0 {
            door = false
            print("輸")
        }
    }
}
