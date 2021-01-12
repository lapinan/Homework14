//
//  TabBarViewController.swift
//  Realm-Homework
//
//  Created by Андрей Лапин on 12.01.2021.
//

import UIKit

class TabBarViewController: UITabBarController {
    
    let userDefautlsVC = UserDefaultsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        setConfigUserDefautlsVC()
        
        tabBar.tintColor = .red
        tabBar.backgroundColor = .black
        
        setViewControllers([userDefautlsVC], animated: true)
        
    }
    
    private func setConfigUserDefautlsVC() {
        userDefautlsVC.tabBarItem = UITabBarItem(title: "UserDefautls", image: nil, tag: 0)
    }

}
