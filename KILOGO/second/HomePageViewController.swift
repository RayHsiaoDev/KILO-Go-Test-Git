//
//  HomePageViewController.swift
//  HomePageViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit
import Firebase
import AVFoundation

protocol HomePageViewControllerDelegate: AnyObject {
    func homePageViewController(bool: Bool)
}

class HomePageViewController: UIViewController {
    
    weak var delegate: HomePageViewControllerDelegate?
    let backgroundImage = UIImageView()
    var musicPlayer = AVPlayer()
    let headView = UIImageView() //這裡可以增加真正的功能
    var animatePlayerLayer = AVPlayerLayer()
    let circleView = UIView()
    let circleProgressBarNew = CircleProgressBar()
    let medalImage = UIImageView()
    let kcalProgressBar = KcalProgressBar()
    let kcalImage = UIImageView()
    let number = UILabel()
    let startButton = UIButton()
    let pedometerButton = UIButton()
    let levelUpButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(backgroundImage)
        view.layer.addSublayer(animatePlayerLayer)
        view.addSubview(circleView)
        view.addSubview(headView)
        view.addSubview(circleProgressBarNew)
        view.addSubview(medalImage)
        view.addSubview(kcalProgressBar)
        view.addSubview(kcalProgressBar.image)
        view.addSubview(kcalImage)
        view.addSubview(number)
        view.addSubview(startButton)
        view.addSubview(pedometerButton)
        view.addSubview(levelUpButton)
        configureBackgroundImage()
        configureMusicPlayer()
        configureHeadView()
        configureAnimatePlayer()
        configureCircleView()
        configureMedalImage()
        configureCircleProgressBar()
        configureKcalImage()
        configureKcalProgressBar()
        configureNumber()
        configureStartButton()
        configurePedometerButton()
        configureLevelUpButton()
        checkUserSignIn()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //測試 NotificationCenter.default 需不需要放這裡
    }
    
    
    func checkUserSignIn() {
        if AuthManager2.share.isSignin {
            let email = AuthManager2.share.userEmail
            print("使用者：\(email)登入中")
        } else {
            print("沒有使用者登入中")
        }
    }
    
    
    func configureBackgroundImage() {
        backgroundImage.image =  UIImage(named: "技能背景")
        backgroundImage.clipsToBounds = true
        backgroundImage.frame = view.bounds
    }
    
    
    func configureMusicPlayer() {
        guard let musicURL = Bundle.main.url(forResource: "mainMusic", withExtension: "mp3") else { return }
        musicPlayer = AVPlayer(url: musicURL)
//        musicPlayer.play()
    }
    
    
    func configureAnimatePlayer() {
        guard let videoURL = Bundle.main.url(forResource: "主畫面熊動畫", withExtension: "mov") else { return }
        animatePlayerLayer.player = AVPlayer(url: videoURL)
        animatePlayerLayer.frame = CGRect(x: -50, y: -50, width: view.width+100, height: view.height+100)
        guard let player = animatePlayerLayer.player else { return }
        player.play()
        
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: player.currentItem, queue: .main) { result in
            player.seek(to: .zero)
            player.play()
        }
    }
    
    
    func configureHeadView() {
        headView.image = UIImage(named: "上面bar")
        
        headView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            headView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            headView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            headView.widthAnchor.constraint(equalToConstant: view.width + 10),
            headView.heightAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
    func configureCircleView() {
        let circleWidth: CGFloat = 300
        circleView.backgroundColor = .white
        circleView.layer.shadowOffset = CGSize(width: 0, height: 3)
        circleView.layer.shadowOpacity = 1
        circleView.layer.shadowColor = UIColor.gray.cgColor
        circleView.layer.cornerRadius = circleWidth/2 + 3
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: -circleWidth/2),
            circleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -circleWidth/2),
            circleView.widthAnchor.constraint(equalToConstant: circleWidth),
            circleView.heightAnchor.constraint(equalToConstant: circleWidth)
        ])
        
    }
    
    
    func configureCircleProgressBar() {
        circleProgressBarNew.progress = 0.5
        circleProgressBarNew.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleProgressBarNew.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 0.2),
           circleProgressBarNew.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
           circleProgressBarNew.widthAnchor.constraint(equalToConstant: 255),
           circleProgressBarNew.heightAnchor.constraint(equalToConstant: 255)
        ])
    }
    
    
    func configureMedalImage() {
        medalImage.image = UIImage(named: "Ch")
        medalImage.clipsToBounds = true
        medalImage.contentMode = .scaleAspectFill
        
        medalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            medalImage.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 152),
            medalImage.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: -48),
            medalImage.widthAnchor.constraint(equalToConstant: 110),
            medalImage.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    

    func configureKcalProgressBar() {
        kcalProgressBar.color = .red
        kcalProgressBar.progress = 1
        kcalProgressBar.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideImage))
        kcalProgressBar.addGestureRecognizer(tap)

        kcalProgressBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           kcalProgressBar.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 48),
           kcalProgressBar.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 15),
           kcalProgressBar.widthAnchor.constraint(equalToConstant: 220),
           kcalProgressBar.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    
    func configureNumber() {
        number.text = "1200/1500"
        number.font = UIFont.systemFont(ofSize: 13)
        number.textColor = .white
        number.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            number.topAnchor.constraint(equalTo: kcalProgressBar.topAnchor, constant: 4),
            number.centerXAnchor.constraint(equalTo: kcalProgressBar.centerXAnchor, constant: 28),
            number.widthAnchor.constraint(equalToConstant: 100),
            number.heightAnchor.constraint(equalToConstant: 13)
        ])
    }
    
    
    func configureKcalImage() {
        kcalImage.image = UIImage(named: "熱量表")
        kcalImage.clipsToBounds = true
        kcalImage.contentMode = .scaleAspectFill
        kcalImage.isHidden = true
        
        kcalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kcalImage.topAnchor.constraint(equalTo: kcalProgressBar.bottomAnchor, constant: 3),
            kcalImage.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 5),
            kcalImage.widthAnchor.constraint(equalToConstant: 240),
            kcalImage.heightAnchor.constraint(equalToConstant: 115)
        ])
    }
    
    
    func configureStartButton() {
        startButton.clipsToBounds = true
        startButton.setBackgroundImage(UIImage(named: "開始按鈕"), for: .normal)
        startButton.addTarget(self, action: #selector(didTapGameStart), for: .touchUpInside)
        
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 565),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 160),
            startButton.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    
    func configurePedometerButton() {
        pedometerButton.clipsToBounds = true
        pedometerButton.setBackgroundImage(UIImage(named: "計步器按鈕"), for: .normal)
        pedometerButton.addTarget(self, action: #selector(didTapPedometer), for: .touchUpInside)
        
        pedometerButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            pedometerButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 430),
            pedometerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 60),
            pedometerButton.widthAnchor.constraint(equalToConstant: 150),
            pedometerButton.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    
    func configureLevelUpButton() {
        levelUpButton.clipsToBounds = true
        levelUpButton.setBackgroundImage(UIImage(named: "技能升級按鈕"), for: .normal)
        levelUpButton.addTarget(self, action: #selector(didTapLevelUp), for: .touchUpInside)
        
        levelUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            levelUpButton.topAnchor.constraint(equalTo: pedometerButton.bottomAnchor, constant: -28),
            levelUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 58),
            levelUpButton.widthAnchor.constraint(equalToConstant: 150),
            levelUpButton.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    
    @objc func hideImage() {
        if kcalImage.isHidden {
            kcalImage.isHidden = false
        } else {
            kcalImage.isHidden = true
        }
    }
    
    
    @objc func didTapPedometer() {
        
    }
    
    
    @objc func didTapLevelUp() {
        let vc = LevelSkillViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    @objc func didTapGameStart() {
        self.view.window?.rootViewController = LoadingViewController()
        musicPlayer.pause()
    }
    
}
