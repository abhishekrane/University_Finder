//
//  Tableviewcell.swift
//  project
//
//  Created by Abhishek rane on 12/11/17.
//  Copyright © 2017 Abhishek rane. All rights reserved.
//

import Foundation
import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var cellview: UIView!
    @IBOutlet weak var id: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
