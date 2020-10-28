//
//  ViewController.swift
//  scrollView_test
//
//  Created by out-belyayeva-ma on 23.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton(type: .system)
    let hiLabel = UILabel()
    let mySwitch = UISwitch()
    let switchLabel = UILabel()
    let picker = UIPickerView()
    let datePicker = UIDatePicker()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.8173183799, green: 0.567671597, blue: 1, alpha: 1)
        
        setButton(titleText: "Press", titleColor: .blue)
        setLabel(textColor: .blue)
        setSwitch()
//        setPicker()
        setDatePicker()

    }
    
    @objc private func showAlert() {
        hiLabel.text = ""
        self.createAlert(title: "Enter yor name", message: "Your name:", style: .alert)
//        self.createAlert(title: "testAlert", message: "Alert!", style: .actionSheet)
    }
    
    private func createAlert(title: String, message: String, style: UIAlertController.Style) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: style)
        let alertAction = UIAlertAction(title: "ok", style: .cancel) {(action) in
            style == .alert ? self.addText(alertController: alertController) : nil}
       
        style == .alert ? alertController.addTextField(configurationHandler: nil) : nil
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    private func addText(alertController: UIAlertController) {
        let text = alertController.textFields?.first
        text?.text! != "" ?
            (hiLabel.text! += "Hi, " + (text?.text ?? "noName") + "!") :
            (hiLabel.text! = "")
        print(self.hiLabel.text ?? "nil")
    }
    private func setButton(titleText: String, titleColor: UIColor) {
        button.setTitle(titleText, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(showAlert), for: .touchUpInside)
        view.addSubview(button)
    }
    private func setLabel(textColor: UIColor) {
        hiLabel.textColor = textColor
        view.addSubview(hiLabel)
        hiLabel.translatesAutoresizingMaskIntoConstraints = false
        hiLabel.bottomAnchor.constraint(equalTo: button.topAnchor).isActive = true
        hiLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    private func setSwitch() {
        mySwitch.thumbTintColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        switchLabel.text = "Change background color"
        switchLabel.textColor = .black
        view.addSubview(mySwitch)
        view.addSubview(switchLabel)
        mySwitch.translatesAutoresizingMaskIntoConstraints = false
        mySwitch.topAnchor.constraint(equalTo: view.topAnchor, constant: 160).isActive = true
        mySwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40).isActive = true
        
        switchLabel.translatesAutoresizingMaskIntoConstraints = false
        switchLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40).isActive = true
        switchLabel.bottomAnchor.constraint(equalTo: mySwitch.bottomAnchor).isActive = true
        
        mySwitch.addTarget(self, action: #selector(mySwitchTarget), for: .allEvents)
    }
    
    @objc private func mySwitchTarget(label: UILabel) {
        if mySwitch.isOn {
            view.backgroundColor = #colorLiteral(red: 1, green: 0.437155664, blue: 0, alpha: 1)
            switchLabel.text! = "Switch is on"
        }
        else {
            view.backgroundColor = #colorLiteral(red: 0.8173183799, green: 0.567671597, blue: 1, alpha: 1)
            switchLabel.text! = "Switch is off"
        }
    }
    private func setPicker() {
        view.addSubview(picker)
        picker.dataSource = self
        picker.delegate = self
        picker.translatesAutoresizingMaskIntoConstraints = false
        picker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    private func setDatePicker() {
        datePicker.datePickerMode = .dateAndTime
        view.addSubview(datePicker)
        
        datePicker.translatesAutoresizingMaskIntoConstraints = false
        datePicker.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        var oneYearTime = TimeInterval()
        oneYearTime = 365 * 24 * 60 * 60
        let todayDate = Date()
        datePicker.minimumDate = todayDate.addingTimeInterval(oneYearTime)
        datePicker.maximumDate = todayDate.addingTimeInterval(2 * oneYearTime)
        
    }
}

extension ViewController: UIPickerViewDataSource, UIPickerViewDelegate {
    //сколько компонентов выводить
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //сколько строк в компоненте
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 10
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let result = "row = \(row)"
        return result
    }
    
}
