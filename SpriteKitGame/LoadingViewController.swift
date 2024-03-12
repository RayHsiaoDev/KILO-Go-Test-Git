//
//  LoadingViewController.swift
//  LoadingViewController
//
//  Created by 陳韋綸 on 2021/11/21.
//

import UIKit
import AVFoundation
import Firebase

class LoadingViewController: UIViewController {

    var player = AVPlayer()
    var playerLayer = AVPlayerLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .orange
        guard let path = Bundle.main.url(forResource: "Loading", withExtension: "mov") else {
            print("error")
            return
        }
        player = AVPlayer(url: path)
        playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        view.layer.addSublayer(playerLayer)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        player.play()
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { _ in
            let vc = GameViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: false, completion: nil)
            self.player.seek(to: .zero)
        }
    }
}
