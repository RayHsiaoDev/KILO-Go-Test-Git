//
//  RankPageViewController.swift
//  RankPageViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit

class RankPageViewController: UIViewController {

    private let image: UIImageView = {
       let image = UIImageView()
        image.image = UIImage(named: "排行榜1")
        image.clipsToBounds = true
        image.contentMode = .scaleToFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(image)
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        image.frame = view.bounds
    }
}
