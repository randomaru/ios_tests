//
//  ViewController.swift
//  UITabBarController
//
//  Created by out-belyayeva-ma on 28.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        navigationItem.title = "FirstVC"
        
        let tabBarItem = UITabBarItem(tabBarSystemItem: .contacts, tag: 0)
        
        self.tabBarItem = tabBarItem
        
    }


}

