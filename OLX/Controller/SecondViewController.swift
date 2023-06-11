//
//  SecondViewController.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 11.06.2023.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        createTabbarItem()
        view.backgroundColor = UIColor(red: 46, green: 46 , blue: 46)
    }

    fileprivate func createTabbarItem() {
        var tabBarItem = UITabBarItem()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        
        let heartIcon = UIImage(systemName: "heart", withConfiguration: symbolConfiguration)
        let heartIcon1 = UIImage(systemName: "heart.fill", withConfiguration: symbolConfiguration)
        
        tabBarItem = UITabBarItem(title: "Избранное", image: heartIcon, selectedImage: heartIcon1)
        
        
        self.tabBarItem = tabBarItem
        self.navigationItem.title = "SecondVC"
    }

}
