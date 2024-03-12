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
    
    private let medals2222: UIImageView = {
       let image = UIImageView()
        image.clipsToBounds = true
        image.image = UIImage(named: "熱量表")
        image.contentMode = .scaleAspectFit
        return image
    }()

    var circleProgressBar = PlainCircularProgressBar()
    var horizontalProgressBar = PlainHorizontalProgressBar()
    private let startButton: UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "開始按鈕"), for: .normal)
        return button
    }()

    private let pedometerButton: UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "計步器按鈕"), for: .normal)
        return button
    }()
    
    private let levelUpButton: UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
        button.setBackgroundImage(UIImage(named: "技能升級按鈕"), for: .normal)
        return button
    }()
    
    private let number: UILabel = {
        let number = UILabel()
        number.text = "1200/1500"
        number.font = UIFont.systemFont(ofSize: 13)
        number.textColor = .white
        return number
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        medals2222.isHidden = true
        guard let url = Bundle.main.url(forResource: "mainMusic", withExtension: "mp3") else {
            return
        }
        musicPlayer = AVPlayer(url: url)
        musicPlayer?.play()
        horizontalProgressBar.isUserInteractionEnabled = true
        view.backgroundColor = .white
        view.addSubview(backgroundIM)
        view.layer.addSublayer(animePlayer)
        view.addSubview(circleView)
        view.addSubview(circleProgressBar)
        view.addSubview(headView)
        view.addSubview(kcalProgressBar)
        view.addSubview(kcalProgressBar.image)
//        view.layer.addSublayer(kcalProgressBar.image)
        view.addSubview(startButton)
        view.addSubview(pedometerButton)
        view.addSubview(levelUpButton)
        view.addSubview(medalImage)
//        view.addSubview(kcalImage)
        view.addSubview(number)
        
        configureHeadView()
        configureCircleView()
        configureMedalImage()
        configureKcalProgressBar()
//        configureKcalImage()
        guard let anime = Bundle.main.url(forResource: "主畫面熊動畫", withExtension: "mov") else {
            return
        }
        animePlayer.player = AVPlayer(url: anime)
        horizontalProgressBar.progress = 0.5
        circleProgressBar.progress = 0.7
        startButton.addTarget(self, action: #selector(didTapGameStart), for: .touchUpInside)
        pedometerButton.addTarget(self, action: #selector(didTapPedometer), for: .touchUpInside)
        levelUpButton.addTarget(self, action: #selector(didTapLevelUp), for: .touchUpInside)
        let tap = UITapGestureRecognizer(target: self, action: #selector(FUCK))
        horizontalProgressBar.addGestureRecognizer(tap)
    }
    
    @objc func FUCK() {
        if medals2222.isHidden {
            medals2222.isHidden = false
        } else {
            medals2222.isHidden = true
        }
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
        circleView.layer.cornerRadius = circleWidth/2
        circleView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            circleView.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: -circleWidth/2),
            circleView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -circleWidth/2),
            circleView.widthAnchor.constraint(equalToConstant: circleWidth),
            circleView.heightAnchor.constraint(equalToConstant: circleWidth)
        ])
        
    }
    
    
    func configureMedalImage() {
        medalImage.image = UIImage(named: "Ch")
        medalImage.clipsToBounds = true
        medalImage.contentMode = .scaleAspectFill
        
        medalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            medalImage.topAnchor.constraint(equalTo: circleView.topAnchor, constant: 153),
            medalImage.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: -52),
            medalImage.widthAnchor.constraint(equalToConstant: 110),
            medalImage.heightAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    
    func configureKcalProgressBar() {
        kcalProgressBar.color = .red
        kcalProgressBar.progress = 0.4
        kcalProgressBar.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
           kcalProgressBar.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 50),
           kcalProgressBar.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 15),
           kcalProgressBar.widthAnchor.constraint(equalToConstant: 220),
           kcalProgressBar.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configureKcalImage() {
        kcalImage.image = UIImage(named: "熱量表")
        kcalImage.clipsToBounds = true
        kcalImage.contentMode = .scaleAspectFill
        
        kcalImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            kcalImage.topAnchor.constraint(equalTo: headView.bottomAnchor, constant: 30),
            kcalImage.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 50),
            kcalImage.widthAnchor.constraint(equalToConstant: 200),
            kcalImage.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    
    @objc func didTapLevelUp() {
        let vc = LevelSkillViewController()
        self.navigationController?.pushViewController(vc, animated: true)
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
        let circleWidth = view.width/3*2+10
//        circleView.frame = CGRect(x: 0-circleWidth/2, y: headerView.bottom-circleWidth/2, width: circleWidth, height: circleWidth)
//        circleView.layer.cornerRadius = circleWidth/2
        
//        medals.frame = CGRect(origin: CGPoint(x: circleView.center.x-10, y: circleView.center.y), size: CGSize(width: circleWidth/4+30, height: circleWidth/4+30))
        
        // circleBar
        circleProgressBar.frame.size = CGSize(width: circleWidth-20, height: circleWidth-20)
        circleProgressBar.center = CGPoint(x: circleView.center.x-circleProgressBar.width/2, y: circleView.center.y+circleProgressBar.height/2)
        circleProgressBar.color = UIColor(red: 1, green: 0.6, blue: 0.3, alpha: 1)
        // horizontalBar
        horizontalProgressBar.frame = CGRect(x: circleView.right, y: headerView.bottom+50, width: view.width-circleView.width/2-30, height: 20)
        horizontalProgressBar.color = .red
        
        startButton.frame = CGRect(x: 140, y: view.height/3*2+50, width: view.width-280, height: view.width-280)
        pedometerButton.frame = CGRect(x: view.right-90, y: view.center.y+20, width: 150, height: 130)
        levelUpButton.frame = CGRect(x: view.right-90, y: pedometerButton.bottom-30, width: 150, height: 130)
        animePlayer.frame = CGRect(x: -50, y: -50, width: view.width+100, height: view.height+100)
//        medals2222.frame = CGRect(x: horizontalProgressBar.left, y: horizontalProgressBar.bottom-35, width: horizontalProgressBar.width, height: 200)
        
        number.frame = CGRect(x: 230, y: 134, width: 100, height: 13)
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
