//
//  TabBarViewController.swift
//  TabBarViewController
//
//  Created by 陳韋綸 on 2021/11/10.
//

import UIKit
import AVFoundation

class TabBarViewController: UITabBarController {
    
    let igVC = IGViewController()
    let foodVC = FoodDataViewController()
    let HomeVC = HomePageViewController()
    let RankVC = RankPageViewController()
    let settingVC = SettingViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .black
        viewControllers = [createIgNC(), createFoodDataNC(), createHomeNC(), createRankNC(), createSettingNC()]
        selectedIndex = 2
        self.tabBar.backgroundColor = .white
    }
    
    
    func createIgNC() -> UINavigationController {
        igVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "熊"), tag: 1)
        igVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: igVC)
    }
    
    
    func createFoodDataNC() -> UINavigationController {
        foodVC.delegate = HomeVC
        foodVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "湯匙"), tag: 2)
        foodVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: foodVC)
    }
    
    
    func createHomeNC() -> UINavigationController {
        HomeVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "家"), tag: 3)
        HomeVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: HomeVC)
    }
    
    
    func createRankNC() -> UINavigationController {
        RankVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "排行榜"), tag: 4)
        RankVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: RankVC)
    }
    
    
    func createSettingNC() -> UINavigationController {
        settingVC.tabBarItem = UITabBarItem(title: nil, image: UIImage(named: "設定"), tag: 5)
        settingVC.tabBarItem.imageInsets = UIEdgeInsets(top: 15, left: 0, bottom: -15, right: 0)
        
        return UINavigationController(rootViewController: settingVC)
    }
}
