//
//  TableViewController.swift
//  UITableViewController
//
//  Created by out-belyayeva-ma on 06.11.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var itemArray = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)

        
        itemArray.append(Model(name: "Kate", profession: "Dancer"))
   
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if  let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath) as? TableViewCell {
            
            let item = itemArray[indexPath.row]
            cell.refresh(item)
            cell.addSubview(cell.nameLabel)
            cell.addSubview(cell.detailLabel)
            
            NSLayoutConstraint.activate([
                cell.nameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
                cell.nameLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 30)
            ])
            
            return cell
        }

        return UITableViewCell()
    }
    
    override  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50.00
    }

}
