//
//  ViewController.swift
//  UINavigationViewController
//
//  Created by out-belyayeva-ma on 28.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var displaySecondButton = UIButton(type: .system)
    let titleSwitch = UISwitch()
    
    fileprivate func setLeftSwitch() {
        titleSwitch.isOn = true
        titleSwitch.addTarget(self , action: #selector(switchIsChange(param:)), for: .valueChanged)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: titleSwitch)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        
        let items = ["up", "down"]
        let segmentedControl = UISegmentedControl(items: items)
        segmentedControl.isMomentary = true //кнопки будут отжиматься
        segmentedControl.addTarget(self, action: #selector(segmentedControlTarget(param:)), for: .valueChanged)
        navigationItem.rightBarButtonItem =  UIBarButtonItem(customView: segmentedControl)
        
        
        setTitleImage()
        setDisplaySecondButton()
//        setNavigationButton()
        setLeftSwitch()
    }
    
    @objc private func segmentedControlTarget(param: UISegmentedControl) {
       
        switch param.selectedSegmentIndex {
        case 0:
            print("up")
        case 1:
            print("down")
        default:
            break
        }
    }
    
    @objc private func switchIsChange(param: UISwitch) {
        if param.isOn {
            print("Switch is on ")
        } else {
            print("Switch is off" )
        }
    }
    
    private func setNavigationButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                            target: self,
                                                            action: #selector(performAdd(param:)))
    }
    
    @objc private func performAdd(param: UIBarButtonItem) {
        print("Add click")
    }
    
    private func setTitleImage() {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        imageView.contentMode = .scaleAspectFit
        let image = UIImage(named: "video-game")
        imageView.image = image
        
        
        navigationItem.titleView = imageView
    }
    
    private func setDisplaySecondButton() {
        displaySecondButton.setTitle("SecondVC", for: .normal)
        displaySecondButton.sizeToFit()
        displaySecondButton.addTarget(self, action: #selector(displaySecondVC), for: .touchUpInside)

        view.addSubview(displaySecondButton)
        displaySecondButton.translatesAutoresizingMaskIntoConstraints = false
        displaySecondButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        displaySecondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

    }
    @objc private func displaySecondVC(paramSender: Any) {

        let secondVC = secondViewController() // cmd+N -> newFile
        navigationController?.pushViewController(secondVC, animated: true)
    }


}
