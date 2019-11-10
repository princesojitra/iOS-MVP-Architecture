//
//  UIViewController+CustomActions.swift
//  Events
//
//  Created by Prince Sojitra on 18/09/19.
//  Copyright © 2019 Prince Sojitra. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func popupAlert(title: String?, message: String?, actionTitles:[String?], actions:[((UIAlertAction) -> Void)?]) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        for (index, title) in actionTitles.enumerated() {
            let iAction = UIAlertAction(title: title, style: .default, handler: actions[index])
            alertController.addAction(iAction)
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addBackButtonOnLeftNavBar() {
        //custom view for back image with custom size
        let viewBack = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        let imageViewBack = UIImageView(frame: CGRect(x: 5, y: 8, width: 15, height: 25))
        
        if let imgBackArrow = UIImage(named: Constants.Assets.Back) {
            imageViewBack.image = imgBackArrow
        }
        viewBack.addSubview(imageViewBack)
        
        let backTap = UITapGestureRecognizer(target: self, action: #selector(backToMain))
        viewBack.addGestureRecognizer(backTap)
        
        let leftBarButtonItem = UIBarButtonItem(customView: viewBack )
        self.navigationItem.leftBarButtonItem = leftBarButtonItem
    }
    
    @objc func backToMain() {
        self.navigationController?.popViewController(animated: true)
    }
}
