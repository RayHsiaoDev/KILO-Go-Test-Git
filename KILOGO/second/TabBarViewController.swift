//
//  TabBarViewController.swift
//  TabBarViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit
import AVFoundation

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let IG = IGViewController()
        let FoodData = FoodDataViewController()
        let Home = HomePageViewController()
        let Rank = RankPageViewController()
        let Setting = SettingViewController()
        let level = LevelSkillViewController()
        
        let navIG = UINavigationController(rootViewController: IG)
        let navFoodData = UINavigationController(rootViewController: FoodData)
        let navHome = UINavigationController(rootViewController: Home)
        let navRank = UINavigationController(rootViewController: Rank)
        let navSetting = UINavigationController(rootViewController: Setting)
        let navLevel = UINavigationController(rootViewController: level)
        
        navIG.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "熊"), tag: 1)
        navFoodData.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "湯匙"), tag: 2)
        navHome.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "家"), tag: 3)
        navRank.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "排行榜"), tag: 4)
        navSetting.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "設定"), tag: 5)
        
        navIG.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        navFoodData.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        navHome.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        navRank.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        navSetting.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        tabBar.tintColor = .black
        setViewControllers([navIG,navFoodData,navHome,navRank,navSetting], animated: false)
        selectedIndex = 2
        self.tabBar.backgroundColor = .white
    }
    
}
