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
    
    private let backgroundIM = ImageModels(type: .LevelBackground)
    var musicPlayer: AVPlayer?
    var animePlayer = AVPlayerLayer()
    weak var delegate: HomePageViewControllerDelegate?
    
    private let headerView = test(frame: .zero)
    //這裡可以增加真正的功能
    let headView = UIImageView()
    let circleView = UIView()
    let medalImage = UIImageView()
    let kcalImage = UIImageView()
    let kcalProgressBar = KcalProgressBar()
    let circleProgressBarNew = CircleProgressBar()
    let startButton = UIButton()
    let pedometerButton = UIButton()
    let levelUpButton = UIButton()
    let number = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let url = Bundle.main.url(forResource: "mainMusic", withExtension: "mp3") else {
            return
        }
        musicPlayer = AVPlayer(url: url)
        musicPlayer?.play()
        view.backgroundColor = .white
        view.addSubview(backgroundIM)
        view.layer.addSublayer(animePlayer)
        view.addSubview(circleView)
//        view.addSubview(circleProgressBar)
        view.addSubview(headView)
        view.addSubview(kcalProgressBar)
        view.addSubview(kcalProgressBar.image)
//        view.layer.addSublayer(kcalProgressBar.image)
        view.addSubview(startButton)
        view.addSubview(pedometerButton)
        view.addSubview(levelUpButton)
        view.addSubview(medalImage)
        view.addSubview(kcalImage)
        view.addSubview(number)
        view.addSubview(circleProgressBarNew)
        configureHeadView()
        configureCircleView()
        configureMedalImage()
        configureCircleProgressBar()
        configureNumber()
        configureKcalImage()
        configureKcalProgressBar()
        configureStartButton()
        configurePedometerButton()
        configureLevelUpButton()

        guard let anime = Bundle.main.url(forResource: "主畫面熊動畫", withExtension: "mov") else {
            return
        }
        animePlayer.player = AVPlayer(url: anime)
        startButton.addTarget(self, action: #selector(didTapGameStart), for: .touchUpInside)
        pedometerButton.addTarget(self, action: #selector(didTapPedometer), for: .touchUpInside)
        levelUpButton.addTarget(self, action: #selector(didTapLevelUp), for: .touchUpInside)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        animePlayer.player?.play()
        NotificationCenter.default.addObserver(forName: .AVPlayerItemDidPlayToEndTime, object: animePlayer.player?.currentItem, queue: .main) { _ in
            self.animePlayer.player?.seek(to: .zero)
            self.animePlayer.player?.play()
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
        startButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            startButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 630),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalToConstant: 160),
            startButton.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    
    func configurePedometerButton() {
        pedometerButton.clipsToBounds = true
        pedometerButton.setBackgroundImage(UIImage(named: "計步器按鈕"), for: .normal)
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
        levelUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            levelUpButton.topAnchor.constraint(equalTo: pedometerButton.bottomAnchor, constant: -28),
            levelUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 58),
            levelUpButton.widthAnchor.constraint(equalToConstant: 150),
            levelUpButton.heightAnchor.constraint(equalToConstant: 130)
        ])
    }
    
    
    @objc func didTapLevelUp() {
        let vc = LevelSkillViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
    
    
    @objc func didTapGameStart() {
        self.view.window?.rootViewController = LoadingViewController()
        musicPlayer?.pause()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        backgroundIM.frame = view.bounds
        headerView.frame = CGRect(x: -5, y: 0, width: view.width+10, height: 80)
//        headerView.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
//        headerView.layer.cornerRadius = 30
//        let circleWidth = view.width/3*2+10
//        circleView.frame = CGRect(x: 0-circleWidth/2, y: headerView.bottom-circleWidth/2, width: circleWidth, height: circleWidth)
//        circleView.layer.cornerRadius = circleWidth/2
        
//        medals.frame = CGRect(origin: CGPoint(x: circleView.center.x-10, y: circleView.center.y), size: CGSize(width: circleWidth/4+30, height: circleWidth/4+30))
        
        // circleBar
//        circleProgressBar.frame.size = CGSize(width: circleWidth-20, height: circleWidth-20)
//        circleProgressBar.center = CGPoint(x: circleView.center.x-circleProgressBar.width/2, y: circleView.center.y+circleProgressBar.height/2)
//        circleProgressBar.color = UIColor(red: 1, green: 0.6, blue: 0.3, alpha: 1)
//        // horizontalBar
//        horizontalProgressBar.frame = CGRect(x: circleView.right, y: headerView.bottom+50, width: view.width-circleView.width/2-30, height: 20)
//        horizontalProgressBar.color = .red
        
//        startbutton.frame = CGRect(x: 140, y: view.height/3*2+50, width: view.width-280, height: view.width-280)
//        pedometerButton.frame = CGRect(x: view.right-90, y: view.center.y+20, width: 150, height: 130)
//        levelUpButton.frame = CGRect(x: view.right-90, y: pedometerButton.bottom-30, width: 150, height: 130)
        animePlayer.frame = CGRect(x: -50, y: -50, width: view.width+100, height: view.height+100)
//        medals2222.frame = CGRect(x: horizontalProgressBar.left, y: horizontalProgressBar.bottom-35, width: horizontalProgressBar.width, height: 200)
        
//        number.frame = CGRect(x: 230, y: 134, width: 100, height: 13)
    }
    
//    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
////        try! Auth.auth().signOut()
//        circleProgressBar.progress += 0.1
//        horizontalProgressBar.progress += 0.1
//        if circleProgressBar.progress > 0.99 || horizontalProgressBar.progress > 0.99 {
//            print("ok")
//            circleProgressBar.progress = 0
//            horizontalProgressBar.progress = 0
//        }
//    }
}
