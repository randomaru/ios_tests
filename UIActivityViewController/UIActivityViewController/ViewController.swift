//
//  ViewController.swift
//  UIActivityViewController
//
//  Created by out-belyayeva-ma on 27.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let button = UIButton()
    var textField = UITextField()
    var activityVC: UIActivityViewController? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        
        setTextField()
        setButton()
    }
    
    private func setTextField() {
        
        textField.borderStyle = .roundedRect
        textField.placeholder = "Enter text for share"
        textField.delegate = self
        
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        textField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }

    private func setButton() {
        button.setTitle("Share", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)
        button.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1), for: .highlighted)
        button.addTarget(self, action: #selector(handleShare), for: .touchUpInside)
        
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        button.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 20).isActive = true
        button.widthAnchor.constraint(equalToConstant: 100).isActive = true
        button.heightAnchor.constraint(equalToConstant: 30).isActive = true
        button.layer.cornerRadius = 8
    }
    
    @objc private func handleShare(paramSender: Any) {
        
        let text = textField.text
        
        if text?.count == 0 {
            let message = "You must fill field before share"
            let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .cancel, handler: nil)
            alertController.addAction(action)
            present(alertController, animated: true, completion: nil)
        }
        activityVC = UIActivityViewController(activityItems: [textField.text ?? "nil"], applicationActivities: nil)
        present(activityVC!, animated: true, completion: nil)
    }
    
    internal func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return  true

}
}
