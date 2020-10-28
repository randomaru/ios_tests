//
//  secondViewController.swift
//  UINavigationViewController
//
//  Created by out-belyayeva-ma on 28.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {

    var destroyButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SecondVC"
        view.backgroundColor = #colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)

        setDestroyButton()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        
//        perform(#selector(goBack), with: nil, afterDelay: 3.0) // go back after 3 seconds
    }
    
    @objc private func goBack() {
        navigationController?.popViewController(animated: true)
        
        //Получаем текущий массив контроллеров:
        var currentControllerArray = navigationController?.viewControllers
        
        //Удаляем последний контроллер
        currentControllerArray?.removeLast()
        
        //Присвоим
        guard let newController = currentControllerArray else { return }
            navigationController?.viewControllers = newController
        
    }
    
    private func setDestroyButton() {
        
        destroyButton.setTitle("Destroy previous VC", for: .normal)
        destroyButton.addTarget(self, action: #selector(goBack), for: .touchUpInside)
        
        view.addSubview(destroyButton)
        
        destroyButton.translatesAutoresizingMaskIntoConstraints = false
        destroyButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        destroyButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }


}
