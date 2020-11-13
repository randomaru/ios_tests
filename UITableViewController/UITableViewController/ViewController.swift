//
//  ViewController.swift
//  UITableViewController
//
//  Created by out-belyayeva-ma on 06.11.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let tableVC = UITableViewController(style: .plain)
//    var tableData = ["Masha", "Sasha", "Roma", "Andrey", "Vlad"]
    var tableData = [Date]()
    var cellIdentifier = "Cell"
    let refresh = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(tableVC.tableView)
        setRefreshControl()
        setTable()
    }
    
    private func setTable() {
        
        tableVC.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableVC.tableView.delegate = self
        tableVC.tableView.dataSource = self
        tableVC.tableView.addSubview(refresh)
    }
    
    private func setRefreshControl() {
        refresh.addTarget(self, action: #selector(refreshTarget), for:  .valueChanged)
        refresh.tintColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
    }
    
    @objc private func refreshTarget() {
        tableData.append(Date())
        refresh.endRefreshing()
        ///создаем новый indexPath
        let indexPathNewRow = IndexPath(row: tableData.count - 1, section: 0)
        tableVC.tableView.insertRows(at: [indexPathNewRow], with: .automatic)
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        let item = tableData[indexPath.row]
        cell.textLabel?.text = "\(item)"
        
        return cell
    }
    
    
}

