//
//  EventDetailsVC.swift
//  Events
//
//  Created by Prince Sojitra on 17/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//


import UIKit

class EventDetailsVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet weak var vwTopGrediant: UIView!
    @IBOutlet var lblDeparture: UILabel!
    @IBOutlet var lblArrival: UILabel!
    @IBOutlet var lblDepartureTime: UILabel!
    @IBOutlet var lblArrivalTime: UILabel!
    @IBOutlet var lblCaptain: UILabel!
    @IBOutlet var lblFristOfficer: UILabel!
    @IBOutlet var lblFlightNo: UILabel!
    @IBOutlet var lblAircraftType: UILabel!
    @IBOutlet var lblTravelDate: UILabel!
    @IBOutlet var imgVwRightArrow: UIImageView!
    @IBOutlet var lblLayOverTime: UILabel!
    
    //MARK: - Variable
    var eventDetailsPresenter:EventDetailsPresenter! = nil
    
}

//MARK: - UIViewController Life Cycle
extension EventDetailsVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.fnDefaultSetUp()
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}

// MARK: - UIViewController Actions & Events
extension EventDetailsVC {
    
}

// MARK: - UIViewController Others
extension EventDetailsVC {
    
    //Default setup for the view
    func fnDefaultSetUp(){
        self.vwTopGrediant.setGradientBackground(colours: [Constants.Colours.PrimaryGrey.cgColor,Constants.Colours.GrediantRed.cgColor])
        self.navigationItem.title = Constants.Strings.strEventDetailsNavTitle
        self.addBackButtonOnLeftNavBar()
        self.setEventDetails()
    }
    
    
    //Setup Event details
    func setEventDetails(){
        self.lblLayOverTime.text = self.eventDetailsPresenter.getTravelTime()
        self.lblArrivalTime.text = self.eventDetailsPresenter.getArrivalTime()
        self.lblDepartureTime.text = self.eventDetailsPresenter.getDepartureTime()
        self.lblFristOfficer.text = self.eventDetailsPresenter.getFirstOfficer()
        self.lblCaptain.text = self.eventDetailsPresenter.getCaptain()
        self.lblFlightNo.text = self.eventDetailsPresenter.getFlightNumber()
        self.lblAircraftType.text = self.eventDetailsPresenter.getAircrafType()
        self.lblArrival.text = self.eventDetailsPresenter.getArrival()
        self.lblDeparture.text = self.eventDetailsPresenter.getDeparture()
        self.lblTravelDate.text = self.eventDetailsPresenter.getTravelDate()
        self.imgVwRightArrow.image = self.eventDetailsPresenter.getRightArrowImg()
    }
}


