//
//  CustomLoader.swift
//  Events
//
//  Created by Prince Sojitra on 19/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.

import Foundation
import Foundation
import UIKit

class CustomLoader : NSObject {
    
    private override init() { }
    
    static let shared:CustomLoader  = CustomLoader()
    var vwLoader:UIView?
    
    //show uiactivity indicator
    func showLoader(color:UIColor = Constants.Colours.PrimaryRed,superView:UIView? = nil) {
        
        self.vwLoader = UIView.init(frame: UIScreen.main.bounds)
        self.vwLoader?.backgroundColor =  UIColor.clear
        self.vwLoader?.clipsToBounds = true
        self.vwLoader?.tag = 1010
        
        let iActivityIndicator = UIActivityIndicatorView(style: .whiteLarge)
        iActivityIndicator.color = color
        iActivityIndicator.center = self.vwLoader!.center
        
        self.vwLoader?.addSubview(iActivityIndicator)
        self.vwLoader?.bringSubviewToFront(iActivityIndicator)
        
        DispatchQueue.main.async {
            iActivityIndicator.startAnimating()
        }
        Constants.APPDELEGATE.window?.addSubview( self.vwLoader!)
        Constants.APPDELEGATE.window?.bringSubviewToFront(self.vwLoader!)
        
    }
    
    //hide uiactivity indicator
    func hideLoader(SuperView:UIView? = nil) {
        
        guard Constants.APPDELEGATE.window != nil else {return}
        
        //if its main threrad then hide loader else get themain thread from gloabal queue and update ui on main thread to prevent app crash
        if Thread.isMainThread {
            listSubviews(view: Constants.APPDELEGATE.window!, tagtoRemove: 1010)
        } else {
            DispatchQueue.global(qos: .default).async {
                DispatchQueue.main.sync {
                    self.listSubviews(view: Constants.APPDELEGATE.window!, tagtoRemove: 1010)
                    self.vwLoader = nil
                }
            }
        }
    }
    
    //Check subivews and remove it if any exist
    func listSubviews(view: UIView,tagtoRemove:Int) {
        // Get the subviews of the view
        let subviews = view.subviews
        // Return if there are no subviews
        if subviews.count == 0 {
            return
        }
        for subview: UIView in subviews {
            if subview.tag == tagtoRemove {
                subview.removeFromSuperview()
            }
        }
    }
}
