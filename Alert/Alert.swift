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
    func alertOkView(viewController:UIViewController,message:String) {
        let alert = UIAlertController(title: ReuseAbleIdentifier.AppNameIdentifier.identifier, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        viewController.present(alert, animated: true, completion: nil)
    }
}
