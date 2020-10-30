//
//  ViewController.swift
//  UiButton
//
//  Created by out-belyayeva-ma on 29.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

//

class ViewController: UIViewController {

    
    let button = UIButton(type: .roundedRect)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        
        view.addSubview(button)
        button.frame = CGRect(x: 110, y: 200, width: 100, height: 44)
        button.setTitle("sdfsdfsdf", for: .normal)
        button.setTitle("щд щд щд", for: .highlighted)
    }


}

