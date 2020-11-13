//
//  ViewController.swift
//  UITableView
//
//  Created by out-belyayeva-ma on 05.11.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var table = UITableView()
    let indentifire = "MyCell"
    var array = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var barButtonEdit = UIBarButtonItem()
    var barButtonDone = UIBarButtonItem()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        navigationItem.title = "Table"
        
        barButtonEdit = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editTable))
        barButtonDone = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(editTable))
        navigationItem.rightBarButtonItem = barButtonEdit
        
        
        setTableView()
    }
    
    private func setTableView() {
        table = UITableView(frame: self.view.bounds, style: .plain)
        table.register(UITableViewCell.self, forCellReuseIdentifier: indentifire)
        table.delegate = self
        table.dataSource = self
        
        view.addSubview(table)
        table.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            table.leftAnchor.constraint(equalTo: view.leftAnchor),
            table.rightAnchor.constraint(equalTo: view.rightAnchor),
            table.topAnchor.constraint(equalTo: view.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func editTable() {
        if !table.isEditing {
            navigationItem.rightBarButtonItem = barButtonDone
            table.isEditing = true
        } else {
            navigationItem.rightBarButtonItem = barButtonEdit
            table.isEditing = false
        }
    }
    
//MARK: UITableViewDataSource
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 5
//    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        switch section {
//        case 0:
//            return 3
//        case 1:
//            return 5
//        case 2:
//            return 8
//        default:
//            return 2
//        }
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = table.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
//        cell.textLabel?.text = "section=\(indexPath.section)\\cell=\(indexPath.row)"
//        cell.accessoryType = .detailButton
//
//        switch indexPath.section {
//        case 0:
//            cell.backgroundColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
//        case 1:
//            cell.backgroundColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
//        case 2:
//            cell.backgroundColor = #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1)
//        default:
//            cell.backgroundColor = .random()
        let cell = table.dequeueReusableCell(withIdentifier: indentifire, for: indexPath)
        let number = array[indexPath.row]
        
        cell.textLabel?.text = number
        
        return cell
    }
    
    //MARK: UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.0
    }
    
    func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        print("Accesory path = ", indexPath)
        
        let ourCell = tableView.cellForRow(at: indexPath)
        print("Cell title=", ourCell?.textLabel?.text ?? "nil")
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let number = array[indexPath.row]
        print(number)
    }
    
    //MARK: table delete
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.array.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .left)
        }
    }
    
    //MARK: table move
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = array[sourceIndexPath.row]
        array.remove(at: sourceIndexPath.row)
        array.insert(item, at: destinationIndexPath.row)
    }
    
    //MARK: table copy
    func tableView(_ tableView: UITableView, shouldShowMenuForRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, canPerformAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        print(action)
        if action == #selector(copy(_:)) {
            print("Copy")
            return true
        }
        return true
    }
    
    func tableView(_ tableView: UITableView, performAction action: Selector, forRowAt indexPath: IndexPath, withSender sender: Any?) {
        if action == #selector(copy(_:)) {
            let cell = tableView.cellForRow(at: indexPath)
            let pasteBoard = UIPasteboard.general
            pasteBoard.string = cell?.textLabel?.text
        }
    }
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(
           red:   .random(),
           green: .random(),
           blue:  .random(),
           alpha: 1.0
        )
    }
}
