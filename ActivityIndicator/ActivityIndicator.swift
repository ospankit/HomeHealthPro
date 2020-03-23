//
//  ActivityIndicator.swift
//  HomeHealthPro
//
//  Created by ankit shelar on 21/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
import UIKit

class ActivityIndicator {
    
    static let shared  = ActivityIndicator()

    let activity = NVActivityIndicatorView(frame: .zero, type: .circleStrokeSpin, color: .colorPrimary, padding: 10)
    
    func showIndicator(view:UIViewController){
        activity.translatesAutoresizingMaskIntoConstraints = false
        view.view.addSubview(activity)
        NSLayoutConstraint.activate([
            activity.widthAnchor.constraint(equalToConstant: 100),
            activity.heightAnchor.constraint(equalToConstant: 100),
            activity.centerYAnchor.constraint(equalTo: view.view.centerYAnchor),
            activity.centerXAnchor.constraint(equalTo: view.view.centerXAnchor)
        ])
        //activity.superview?.isUserInteractionEnabled = false
        activity.startAnimating()
    }
    
    func hideActivity() {
        //activity.superview?.isUserInteractionEnabled = true
        activity.stopAnimating()
        activity.removeFromSuperview()
    }
}
