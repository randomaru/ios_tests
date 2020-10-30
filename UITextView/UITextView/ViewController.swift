//
//  ViewController.swift
//  UITextView
//
//  Created by out-belyayeva-ma on 29.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    var textView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextField(param:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(updateTextField(param:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        setTextView()
    }
    
    private func setTextView() {
        textView = UITextView()
        textView.text = "Cat cat Cat Dog"
        textView.contentInset = UIEdgeInsets(top: 30, left: 60, bottom: 60, right: 0)
        textView.font = UIFont.systemFont(ofSize: 20)
        textView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textView.delegate = self
        view.addSubview(textView)
        
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.widthAnchor.constraint(equalToConstant: view.bounds.width - 50).isActive = true
        textView.heightAnchor.constraint(equalToConstant: view.bounds.height / 2).isActive = true
        textView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        textView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    
    //когда нажимаешь на view - прячется клавиатура и редактирование текста сворачивается
    //textView перестает быть активным ко взаимодействию
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.resignFirstResponder()
        textView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        textView.contentInset = UIEdgeInsets(top: 30, left: 60, bottom: 60, right: 0)
    }
    
    
    @objc private func updateTextField(param: Notification) {
        let userInfo = param.userInfo

        ///так мы получаем все контуры и точки этой клавиатуры
        let getKeyboardRect = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        ///переводим
        let keyboardFrame = view.convert(getKeyboardRect, to: view.window)

        ///если клавитаура прячется то убираем все на место
        if param.name == UIResponder.keyboardWillHideNotification {
            textView.contentInset = UIEdgeInsets.zero
        } else {
            ///а если появляется - учитывать ее высоту
            textView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height , right: 0)
            textView.scrollIndicatorInsets = textView.contentInset
        }
        textView.scrollRangeToVisible(textView.selectedRange)
    }
         
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }

}

