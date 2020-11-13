//
//  TableViewCell.swift
//  UITableViewController
//
//  Created by out-belyayeva-ma on 06.11.2020.
//  Copyright © 2020 out-belyayeva-ma. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    var nameLabel = UILabel()
    var detailLabel = UILabel()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    public  func refresh(_ model: Model) {
        nameLabel.text = model.name
        detailLabel.text = model.profession
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init()
        
       
    }
}
