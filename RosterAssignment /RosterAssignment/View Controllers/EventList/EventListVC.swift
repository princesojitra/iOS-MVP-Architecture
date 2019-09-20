//
//  EventListVC.swift
//  RosterAssignment
//
//  Created by Prince Sojitra on 16/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//


import UIKit
import RealmSwift
import Realm

class EventListVC: UIViewController {
    
    //MARK: - @IBOutlet
    @IBOutlet var tblEventList: UITableView!
    
    //MARK: - Variable
    fileprivate let eventPresenter = EventPresenter(service: EventService())
    fileprivate var eventSectionsToDisplay = [String]()
    fileprivate var eventSectionItemsTodisplay = [[EventList]]()
    private let refreshControl = UIRefreshControl()
}

//MARK: - UIViewController Life Cycle
extension EventListVC {
    
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
extension EventListVC {
    //Refresh data on pull to refresh
    @objc private func refreshData(_ sender: Any) {
        self.stopLoaderWithEndRefreshing()
        self.eventPresenter.getEvents()
        self.tblEventList.reloadData()
    }
}


// MARK: - UIViewController Others
extension EventListVC {
    
    //Default setup fot the view
    func fnDefaultSetUp(){
        self.navigationItem.title = Constants.Strings.strEventListNavTitle
        self.setTableView()
        self.stopLoaderWithEndRefreshing()
        self.eventPresenter.attachView(self)
        self.eventPresenter.getEvents()
        self.tblEventList.reloadData()
    }
    
    
    //Setup Tableview UI
    func setTableView(){
        tblEventList.dataSource = self
        tblEventList.estimatedRowHeight = 124
        if #available(iOS 10.0, *) {
            tblEventList.refreshControl = refreshControl
        } else {
            
            tblEventList.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
    }
    
    
    //Stop Loader & Refresh control if availbe on screen
    func stopLoaderWithEndRefreshing(){
        CustomLoader.shared.hideLoader()
        DispatchQueue.main.async {  [weak self] in
            guard let strongSelf = self else { return }
            if strongSelf.refreshControl.isRefreshing {
                strongSelf.refreshControl.endRefreshing()
            } else if !strongSelf.refreshControl.isHidden {
                strongSelf.refreshControl.beginRefreshing()
                strongSelf.refreshControl.endRefreshing()
            }
            
            if self?.tblEventList.contentOffset != CGPoint.zero {
                self?.tblEventList.setContentOffset(CGPoint.zero, animated: true)
            }
        }
    }
}

//MARK: - Events Data Fetch & Set
extension EventListVC: EventView {
    
    //Push and show event details VC
    func showEventDetails(nextPresenter: EventDetailsPresenter) {
        let eventDetailsVC = Constants.MAINSTORYBOARD.instantiateViewController(withIdentifier: Constants.ViewControllerIdentifier.EventDetails) as! EventDetailsVC
        eventDetailsVC.eventDetailsPresenter = nextPresenter
        self.navigationController?.pushViewController(eventDetailsVC, animated: true)
        
    }
    
    
    //Setup Events data once succesfully fetched from server side
    func setEvents(_ eventsSections: [String], eventsSectionItems: [[EventList]]) {
        
        //Remove Loader before API Call
        self.stopLoaderWithEndRefreshing()
        
        //Events Sections & Section Items
        self.eventSectionsToDisplay =  eventsSections
        self.eventSectionItemsTodisplay = eventsSectionItems
        
        //Reload Tablview
        self.tblEventList.reloadData()
    }
    
    //Set Empty message if no any events found
    func setEmptyEventsMessage() {
        self.tblEventList.setEmptyMessage(Constants.Strings.strEmptyList)
    }
    
    //Set default message on API Call
    func setAvailableEventsMessage(){
        self.tblEventList.setEmptyMessage("")
    }
    
    //Show no inernet connection alert
    func showErrorMessage(strErrorMEssage:String) {
        self.stopLoaderWithEndRefreshing()
        DispatchQueue.main.async {
            self.popupAlert(title: Constants.APPNAME, message: strErrorMEssage, actionTitles: [Constants.Strings.strOk], actions: [nil])
        }
    }
}

//MARK: - UITableView Datasource & Delegate
extension EventListVC : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.eventSectionItemsTodisplay[section].count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.eventSectionsToDisplay.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellEventList = tableView.dequeueReusableCell(withIdentifier: Constants.TblCellIdentifier.EventList, for: indexPath) as! TblCell_EventList
        cellEventList.tag = indexPath.row
        self.eventPresenter.configureEventCell(cell: cellEventList, indexPath: indexPath)
        return cellEventList
        
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cellEventHeader = tableView.dequeueReusableCell(withIdentifier: Constants.TblCellIdentifier.EventListHeader) as! TblCell_EventListHeader
        self.eventPresenter.configureEventHeaderCell(cell: cellEventHeader, section: section)
        
        return cellEventHeader
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

extension EventListVC : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //Get Event Details and prepare event details vc to push
        self.eventPresenter.showEventDetails(indexPath: indexPath)
    }
}

