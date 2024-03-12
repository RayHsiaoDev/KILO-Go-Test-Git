//
//  resultViewController.swift
//  KILOGO
//
//  Created by 蕭煜勳 on 2021/11/21.
//

import UIKit
import AVFoundation

class ResultViewController: UIViewController {
    
    static let background = UIImage(named: "backGround")
    static let gold = UIImage(named: "Ch")
    static let HomeImage = UIImage(named: "home")
    static let Again = UIImage(named: "again")
    
    let backView = UIImageView(image: background)
    let goldimage = UIImageView(image: gold)
    
    var playerLayer = AVPlayerLayer()
    
    var Result: UILabel = {
        let  title = UILabel()
        title.font = UIFont(name: "Copperplate-Bold", size: 60)
        title.text = "RESULT"
        return title
    }()
    
    var Cal: UILabel = {
        let  title = UILabel()
        title.font = UIFont(name: "Copperplate-Bold", size: 20)
        title.textColor = UIColor.white
        title.text = "消耗卡路里"
        return title
    }()
    
    var Energy: UILabel = {
        let  title = UILabel()
        title.font = UIFont(name: "Copperplate-Bold", size: 20)
        title.textColor = UIColor.white
        title.text = "能量"
        return title
    }()
    
    var Time: UILabel = {
        let  title = UILabel()
        title.font = UIFont(name: "Copperplate-Bold", size: 20)
        title.textColor = UIColor.white
        title.text = "時間"
        return title
    }()
    
    var Bubble: UILabel = {
        let  title = UILabel()
        title.font = UIFont(name: "Copperplate-Bold", size: 20)
        title.textColor = UIColor.white
        title.text = "觸碰數"
        return title
    }()
    
    var Home: UIButton = {
        let button = UIButton()
        button.setImage(HomeImage, for: .normal)
        return button
    }()
    
    var Again: UIButton = {
        let button = UIButton()
        button.setImage(Again, for: .normal)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        let square = CGRect(x: 0, y: 0, width: view.width, height: view.height)
        let label = CGRect(x: view.width/2 - 120, y: 140, width: 400, height: 50)
        let labe2 = CGRect(x: 70, y: 250, width: 100, height: 20)
        let labe3 = CGRect(x: 70, y: 300, width: 100, height: 20)
        let labe4 = CGRect(x: 70, y: 350, width: 100, height: 20)
        let labe5 = CGRect(x: 70, y: 400, width: 100, height: 20)
        let labe6 = CGRect(x: 60, y: 400, width: 300, height: 425)
        let labe7 = CGRect(x: 40, y: 770, width: 153, height: 155)
        let labe8 = CGRect(x: 240, y: 770, width: 147, height: 50)
        
        Result.frame = label
        backView.frame = square
        Cal.frame = labe2
        Energy.frame = labe3
        Time.frame = labe4
        Bubble.frame = labe5
        goldimage.frame = labe6
        Home.frame = labe7
        Again.frame = labe8
        
        view.addSubview(backView)
        view.addSubview(Result)
        view.addSubview(Cal)
        view.addSubview(Energy)
        view.addSubview(Time)
        view.addSubview(Bubble)
        view.addSubview(goldimage)
        view.addSubview(Home)
        view.addSubview(Again)
        
        guard let path = Bundle.main.url(forResource: "winning-1", withExtension: "mov") else {
            return
        }
        
        let player = AVPlayer(url: path)
        playerLayer = AVPlayerLayer(player: player)
        player.play()
        playerLayer.frame = CGRect(x: 0, y: view.height/2, width: view.width, height: view.height/2)
        view.layer.addSublayer(playerLayer)
        
        Home.addTarget(self, action: #selector(didHome), for: .touchUpInside)
        Again.addTarget(self, action: #selector(didAgain), for: .touchUpInside)
        
    }
    
    @objc func didHome() {
        let vc = TabBarViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @objc func didAgain() {
        dismiss(animated: true, completion: nil)
        ARViewController().dismiss(animated: true, completion: nil)
        GameViewController().dismiss(animated: true, completion: nil)
//        var rootVC = self.presentingViewController
//        while let parent = rootVC?.presentingViewController {
//            rootVC = parent
//        }
//
//        rootVC?.dismiss(animated: true, completion: nil)
    }

}
