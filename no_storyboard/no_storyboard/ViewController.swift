//
//  ViewController.swift
//  no_storyboard
//
//  Created by out-belyayeva-ma on 22.10.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9342139363, green: 0.7755997777, blue: 1, alpha: 1)
//        navigationItem.title = "Button"
//        navigationController?.navigationBar.prefersLargeTitles = true

        let button = UIButton(type: .system)
        button.setTitle("Press me", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.1739426255, green: 0.1076086983, blue: 0.9270505905, alpha: 1), for: .normal)
        button.sizeToFit()
        button.center = view.center
        button.addTarget(self, action: #selector(newTableView), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc private func newTableView() {
        let newTable = TableView()
        self.navigationController?.pushViewController(newTable, animated: true)
    }

}


class TableView: UIViewController, UITableViewDataSource {
    
    private var data = ["Apple", "Apricots", "Avocado", "Banana", "Blackberries", "Blackcurrant", "Blueberries", "Breadfruit"]
    let table = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
        navigationItem.title = "Table"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(table)
        self.table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        self.table.dataSource = self
        
        table.translatesAutoresizingMaskIntoConstraints = false
        table.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        table.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        table.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        table.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        switch tableView {
        case tableView:
            return self.data.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = data[indexPath.row]
        cell.accessoryType = .disclosureIndicator
        return cell
    }
}



class TableViewCell: UITableViewCell {
    
}
