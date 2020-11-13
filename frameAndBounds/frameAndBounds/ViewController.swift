//
//  ViewController.swift
//  frameAndBounds
//
//  Created by out-belyayeva-ma on 03.11.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemPink
        
        button.setTitle("test", for: .normal)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerYAnchor.constraint(equalTo: button.centerYAnchor).isActive = true
        button.centerXAnchor.constraint(equalTo: button.centerXAnchor).isActive = true
    }

}
