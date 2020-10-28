//
//  ViewController.swift
//  SegmentedControl
//
//  Created by out-belyayeva-ma on 27.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var segmentedControl = UISegmentedControl()
    var imageView = UIImageView()
    
    var menuStore = ["one", "two", "three"]
    let images = [UIImage(named: "cat-1.jpg"), UIImage(named: "cat-2.jpg"), UIImage(named: "cat-3.jpeg")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        
        setImage()
        setSegmentedControl()
        
    }
    private func setImage() {
        
        imageView.image = images[0]
        view.addSubview(imageView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 400).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 400).isActive = true
    }
    private func setSegmentedControl() {
        
        segmentedControl = UISegmentedControl(items: menuStore)
              
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        segmentedControl.bottomAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 45).isActive = true
        segmentedControl.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        segmentedControl.addTarget(self, action: #selector(changeImage), for: .valueChanged)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.backgroundColor = #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)
        segmentedControl.selectedSegmentTintColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
    }
    @objc private func changeImage(sender: UISegmentedControl) {
        if sender == segmentedControl {
            imageView.image = images[sender.selectedSegmentIndex]
        }
    }


}

