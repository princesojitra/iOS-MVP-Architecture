//
//  TblCell_EventListHeader.swift
//  Events
//
//  Created by Prince Sojitra on 16/9/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//

import UIKit


class TblCell_EventListHeader: UITableViewCell {
    
    
    //MARK: - @IBOutlet
    @IBOutlet var lblTitle: UILabel!
    
    //MARK: - Variable
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.lblTitle.text = ""
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
