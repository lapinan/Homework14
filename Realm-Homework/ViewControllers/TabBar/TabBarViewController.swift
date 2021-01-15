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

    override func viewDidLoad() {
        super.viewDidLoad()

        setConfigUserDefautlsVC()
        setConfigRealmToDoVC()
        
        tabBar.tintColor = .red
        tabBar.barTintColor = .black
        
        setViewControllers([userDefautlsVC, realmToDoVC], animated: true)
        
    }
    
    private func setConfigUserDefautlsVC() {
        userDefautlsVC.tabBarItem = UITabBarItem(title: "UserDefautls", image: nil, tag: 0)
    }
    private func setConfigRealmToDoVC() {
        realmToDoVC.tabBarItem = UITabBarItem(title: "Realm", image: nil, tag: 0)
    }

}
