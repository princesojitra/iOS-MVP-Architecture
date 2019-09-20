//
//  UITableView+EmptyMessage.swift
//  RosterAssignment
//
//  Created by Prince Sojitra on 18/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//


import Foundation
import UIKit

extension UITableView {
    
    func setEmptyMessage(_ message: String,CustomLabel:UILabel? = nil) {
        if let lbl = CustomLabel  {
            self.backgroundView = lbl;
            self.separatorStyle = .none;
        } else {
            let messageLbl = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
            messageLbl.text = message
            messageLbl.textColor = .black
            messageLbl.numberOfLines = 0;
            messageLbl.textAlignment = .center;
            messageLbl.font = UIFont.systemFont(ofSize: 15)
            messageLbl.sizeToFit()
            
            self.backgroundView = messageLbl;
            self.separatorStyle = .none;
        }
    }
    
    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .none
    }
}
