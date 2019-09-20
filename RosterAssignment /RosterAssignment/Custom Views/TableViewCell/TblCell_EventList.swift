//
//  TblCell_EventList.swift
//  RosterAssignment
//
//  Created by Prince Sojitra on 16/9/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//

import UIKit
import FontAwesome_swift

protocol TblCell_EventListDelegate {
    func eventCellTapped(cell: TblCell_EventList)
}

class TblCell_EventList: UITableViewCell {
    
    //MARK: - @IBOutlet
    @IBOutlet var viewOuter: UIView!
    @IBOutlet weak var imgVwContent: UIImageView!
    @IBOutlet var lblTitle: UILabel!
    @IBOutlet var lblStandBy: UILabel!
    @IBOutlet var lblDescription: UILabel!
    @IBOutlet var lblDepartureArrivelTime: UILabel!
    
    //MARK: - Variable
    var delegate: TblCell_EventListDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Initialization code
        self.lblTitle.text = ""
        self.lblDescription.text = ""
        self.lblDepartureArrivelTime.text = ""
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    //Add tap gesture to conentview to detect user action on tap
    func addTapGesture() {
        contentView.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.contentView.addGestureRecognizer(tap)
    }
    
    //Handle Tap on cell
    @objc func handleTap() {
        delegate?.eventCellTapped(cell: self)
    }
    
}
