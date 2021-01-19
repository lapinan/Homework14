//
//  TabBarViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 12.01.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let userDefautlsVC = UserDefaultsViewController()
    let realmToDoVC = UINavigationController(rootViewController: RealmToDoListViewController()) 
    let currentWeatherVC = UINavigationController(rootViewController: CurrentWeatherViewController())
    let coreDataVC = UINavigationController(rootViewController: CoreDataViewController())

    override func viewDidLoad() {
        super.viewDidLoad()

        setConfigUserDefautlsVC()
        setConfigRealmToDoVC()
        setConfigWeatherVC()
        setConfigCoreDataVC()
        
        tabBar.tintColor = .red
        tabBar.barTintColor = .black
        
        setViewControllers([coreDataVC, realmToDoVC, currentWeatherVC, userDefautlsVC], animated: true)
        
    }
    
    private func setConfigUserDefautlsVC() {
        userDefautlsVC.tabBarItem = UITabBarItem(title: "UserDefautls", image: nil, tag: 0)
    }
    private func setConfigRealmToDoVC() {
        realmToDoVC.tabBarItem = UITabBarItem(title: "Realm", image: nil, tag: 1)
    }
    private func setConfigWeatherVC() {
        currentWeatherVC.tabBarItem = UITabBarItem(title: "Weahter", image: nil, tag: 2)
    }
    private func setConfigCoreDataVC() {
        coreDataVC.tabBarItem = UITabBarItem(title: "CoreData", image: nil, tag: 3)
    }

}
