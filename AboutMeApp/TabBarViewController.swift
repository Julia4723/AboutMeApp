//
//  TabBarViewController.swift
//  AboutMeApp
//
//  Created by user on 10.03.2024.
//

import UIKit

class TabBarViewController: UITabBarController {

    
//Здесь делаем таб бар непрозрачным
    override func viewDidLoad() {
        super.viewDidLoad()
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance

    }
    


}
