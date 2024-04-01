//
//  LoadingViewController.swift
//  LoadingViewController
//
//  Created by 陳韋綸 on 2021/11/21.
//

import UIKit
import AVFoundation

class LoadingViewController: UIViewController {

    var playerLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        view.layer.addSublayer(playerLayer)
        configureVideoPlayer()
    }
    
    
    func configureVideoPlayer() {
        guard let videoURL = Bundle.main.url(forResource: "Loading", withExtension: "mov") else { return }
        playerLayer.player = AVPlayer(url: videoURL)
        playerLayer.frame = view.bounds
        
        guard let player = playerLayer.player else { return }
        player.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { result in
            let vc = GameViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false)
            player.seek(to: .zero)
        }
    }
}
