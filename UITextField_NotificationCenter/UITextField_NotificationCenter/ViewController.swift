//
//  ViewController.swift
//  UITextField_NotificationCenter
//
//  Created by out-belyayeva-ma on 28.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    let myTextField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        
        setTextField()
//        NotificationCenter.default.addObserver(self, selector: #selector(textFieldTextDidChange(ncParam:)), name: UITextField.textDidChangeNotification, object: nil)
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillShowNotification, object: nil, queue: nil, using: { nc in
            self.view.frame.origin.y = -200
        })
        NotificationCenter.default.addObserver(forName: UITextField.keyboardWillHideNotification, object: nil, queue: nil, using: { nc in
            self.view.frame.origin.y = 0.0
        })
        
    }
    
    //MARK: CreateUI
    private func setTextField() {
        
        myTextField.placeholder = "Put some text"
        myTextField.contentVerticalAlignment = .center
        myTextField.backgroundColor = .white
        myTextField.borderStyle = .roundedRect
        myTextField.textAlignment = .center
        myTextField.delegate = self
        
        view.addSubview(myTextField)
        
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        myTextField.widthAnchor.constraint(equalToConstant: 200).isActive = true
        myTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        myTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        myTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
    }

    @objc func textFieldTextDidChange(ncParam: NSNotification) {
        print("UITextFieldTextDidChange = \(ncParam)")
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.myTextField.resignFirstResponder()
        return true
    }
    
//    //MARK: - UITextFieldDelegate
//    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
//        //можно ли редактировать поле
//        print("textFieldShould begin editing - это я решаю можно ли редактировать")
//        return true
//
//    }// return NO to disallow editing.
//
//    func textFieldDidBeginEditing(_ textField: UITextField) {
//        // внимание, началось редактирование
//        print("textFieldDidBeginEditing - внимание, началось редактирование ")
//    }// became first responder
//
//    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
//
//        // внимание, закончилосьь ли редактирование
//        print("textFieldShouldEndEditing - внимание,закончилось редактирование")
//        return true
//    }// return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
//
//    func textFieldDidEndEditing(_ textField: UITextField) {
//        print("textFieldDidEndEditing")
//    }
//
//
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        print("shouldChangeCharactersIn = вы ввели = \"\(string)\"")
//        return true
//    }// return NO to not change text
//
//
//    func textFieldShouldClear(_ textField: UITextField) -> Bool {
//        //ты что-то очистил
//        print("textFieldShouldClear = ты что-то очистил")
//
//        return true
//    }// called when clear button pressed. return NO to ignore (no notifications)
//
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        print("textFieldShouldReturn  = хотите убрать клавиатуру?")
//        if textField == myTextField {
//            myTextField.resignFirstResponder()
//
//        }
//        return true
//    }// called when 'return' key pressed. return NO to ignore.
}

