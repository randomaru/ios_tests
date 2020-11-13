//
//  ViewController.swift
//  UIProgressView
//
//  Created by out-belyayeva-ma on 30.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    private let myProgressView = UIProgressView()
    private let myButton = UIButton()
    private var myTimer = Timer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        setProgressView()
        setButton()
        setTimer()
    }
    
    //MARK: Time
    private func setTimer() {
        myTimer = Timer.scheduledTimer(timeInterval: 1,
                                       target: self,
                                       selector: #selector(updateProgressView),
                                       userInfo: nil,
                                       repeats: true)
    }
    
    //MARK: Selector
    @objc private func updateProgressView() {
        if myProgressView.progress !=  1.0 {
            myProgressView.progress += 0.1 / 1.0
        } else if myProgressView.progress == 1.0 {
            UIView.animate(withDuration: 0.7, animations: {
                self.myButton.alpha = 1
                self.myButton.setTitle("Repeat", for: .normal)
                self.myButton.addTarget(self, action: #selector(self.repeatTimer), for: .touchUpInside)
                self.myTimer.invalidate()
            })
        }
    }
    @objc private func repeatTimer() {
        self.myProgressView.progress = 0
        setTimer()
    }
    
    //MARK: UI
    private func setProgressView() {
        myProgressView.progressViewStyle = .bar
        myProgressView.setProgress(0.0, animated: false)
        myProgressView.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        myProgressView.trackTintColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        view.addSubview(myProgressView)
        myProgressView.translatesAutoresizingMaskIntoConstraints = false
        myProgressView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myProgressView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myProgressView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myProgressView.heightAnchor.constraint(equalToConstant: 3).isActive = true
    
        
    }
    
    private func setButton() {
        myButton.setTitle("Loading", for: .normal)
        myButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        myButton.setTitleColor(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1), for: .highlighted)
        myButton.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        myButton.alpha = 0.2
        
        view.addSubview(myButton)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        myButton.topAnchor.constraint(equalTo: myProgressView.bottomAnchor, constant: 40).isActive = true
        myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        myButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }

}

