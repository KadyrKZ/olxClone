//
//  ThirdViewController.swift
//  OLX
//
//  Created by Қадыр Маратұлы on 11.06.2023.
//

import UIKit



class ThirdViewController: UIViewController{
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let symbolConfiguration = UIImage.SymbolConfiguration(pointSize: 18, weight: .medium)
        let plusIcon = UIImage(systemName: "plus.circle", withConfiguration: symbolConfiguration)
        let tabBarItem = UITabBarItem(title: "Cоздать", image: plusIcon, tag: 2)
        self.tabBarItem = tabBarItem
        self.navigationItem.title = "ThirVC"
        view.backgroundColor = UIColor(red: 46, green: 46 , blue: 46)
    }
    
    
    
    
}

