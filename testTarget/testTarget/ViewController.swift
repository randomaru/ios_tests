//
//  ViewController.swift
//  testTarget
//
//  Created by out-belyayeva-ma on 05.11.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    let one = UIButton(type: .system)
    let two = UIButton(type: .system)
    let square = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        let circle = UIView(frame: CGRect.zero)
        circle.backgroundColor = #colorLiteral(red: 0.5725490451, green: 0, blue: 0.2313725501, alpha: 1)
        view.addSubview(circle)
        // отображение круга в виде прямоугольника
        circle.frame = CGRect(x: 200, y: 300, width: 50, height: 50)
        // с закругленными углами
        circle.layer.cornerRadius = circle.bounds.width / 2.0

        createButtons()
    }
    
    private func createButtons() {
        one.setTitle("one", for: .normal)
        two.setTitle("two", for: .normal)
        one.layer.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        one.layer.shadowOffset = CGSize(width: 5, height: 5)
        one.layer.shadowOpacity = 0.7
        one.layer.cornerRadius = 5.0

        view.addSubview(one)
        view.addSubview(two)
        one.translatesAutoresizingMaskIntoConstraints = false
        two.translatesAutoresizingMaskIntoConstraints = false
        one.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        two.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        one.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        two.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        two.addTarget(nil, action: #selector(push(selector:)), for: .touchUpInside)

    }
    
    @objc func push(selector: UIButton) {
        selector.setTitle("TEST", for: .normal)
        self.one.setTitle("lala", for: .normal)
        
    }


}

