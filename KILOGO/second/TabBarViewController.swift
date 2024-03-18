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
        
        tabBar.tintColor = .black
        viewControllers = [createIgNC(), createFoodDataNC(), createHomeNC(), createRankNC(), createSettingNC()]
        selectedIndex = 2
        self.tabBar.backgroundColor = .white
    }
    
    
    func createIgNC() -> UINavigationController {
        let igVC = IGViewController()
        igVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "熊"), tag: 1)
        igVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: igVC)
    }
    
    
    func createFoodDataNC() -> UINavigationController {
        let foodVC = FoodDataViewController()
        foodVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "湯匙"), tag: 2)
        foodVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: foodVC)
    }
    
    
    func createHomeNC() -> UINavigationController {
        let HomeVC = HomePageViewController()
        HomeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "家"), tag: 3)
        HomeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: HomeVC)
    }
    
    
    func createRankNC() -> UINavigationController {
        let RankVC = RankPageViewController()
        RankVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "排行榜"), tag: 4)
        RankVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: RankVC)
    }
    
    
    func createSettingNC() -> UINavigationController {
        let settingVC = SettingViewController()
        settingVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "設定"), tag: 5)
        settingVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: settingVC)
    }
    
    
    func createLevelNC() -> UINavigationController {
        let levelVC = LevelSkillViewController()
        
        return UINavigationController(rootViewController: levelVC)
    }
    
}
