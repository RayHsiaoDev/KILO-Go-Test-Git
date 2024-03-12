//
//  ResultsViewController.swift
//  ResultsViewController
//
//  Created by 陳韋綸 on 2021/12/16.
//

import Foundation
import UIKit
import AVFoundation

class ResultsViewController: UIViewController {
    
    private var player: AVPlayer?
    private let imageBackground = ARImageView(type: .resultsBackground)
    private let image = ARImageView(type: .resultsImage)
    private let returnGame: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "再來一場"), for: .normal)
        button.clipsToBounds = true
        return button
    }()
    private let returnHome: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "回主畫面"), for: .normal)
        button.clipsToBounds = true
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageBackground)
        view.addSubview(image)
        view.addSubview(returnGame)
        view.addSubview(returnHome)
        returnGame.addTarget(self, action: #selector(didTapGame), for: .touchUpInside)
        returnHome.addTarget(self, action: #selector(didTapHome), for: .touchUpInside)
    }
    
    @objc func didTapGame() {
                var rootVC = self.presentingViewController
                while let parent = rootVC?.presentingViewController {
                    rootVC = parent
                }
        
                rootVC?.dismiss(animated: true, completion: nil)
    }
    
    @objc func didTapHome() {
        self.view.window?.rootViewController = TabBarViewController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        guard let url = Bundle.main.url(forResource: "結算音樂", withExtension: "mp3") else {
            return
        }
        player = AVPlayer(url: url)
        player?.play()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageBackground.frame = view.bounds
        image.frame = CGRect(x: 30, y: 150, width: view.width-60, height: view.height-300)
        
        returnGame.frame = CGRect(x: image.left+30, y: image.bottom-50-30, width: image.width/2-50, height: 50)
        returnHome.frame = CGRect(x: image.right-image.width/2+50-30, y: image.bottom-50-30, width: image.width/2-50, height: 50)
    }
}
