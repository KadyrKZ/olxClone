//
//  ForthViewController.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 11.06.2023.
//

import UIKit

class ForthViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        var tabBarItem = UITabBarItem()
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        
        let messageIcon = UIImage(systemName: "message", withConfiguration: symbolConfiguration)
        let messageIcon1 = UIImage(systemName: "message.fill", withConfiguration: symbolConfiguration)
        tabBarItem.badgeColor = .white
        tabBarItem = UITabBarItem(title: "Cообщения", image: messageIcon, selectedImage: messageIcon1)
        self.tabBarItem = tabBarItem
        self.navigationItem.title = "ForthVC"
        view.backgroundColor = UIColor(red: 46, green: 46 , blue: 46)
    }
    

    

}
