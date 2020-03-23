//
//  Alert.swift
//  HomeHealthPro
//
//  Created by Ankit on 28/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation
import UIKit

class Alert{
    
    static let sharedInstance = Alert()
    
    func alertOkView(viewController:UIViewController,message:String) {
        let alert = UIAlertController(title: ReuseAbleIdentifier.AppNameIdentifier.identifier, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ReuseAbleIdentifier.OK.identifier, style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
    
    func alertOKViewWithActionViewDissmiss(viewController:UIViewController,message:String) {
        let alert = UIAlertController(title: ReuseAbleIdentifier.AppNameIdentifier.identifier, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: ReuseAbleIdentifier.OK.identifier, style: .default, handler: nil))
        viewController.present(alert, animated: true) {
            viewController.dismiss(animated: false, completion: nil)
        }
    }
}
