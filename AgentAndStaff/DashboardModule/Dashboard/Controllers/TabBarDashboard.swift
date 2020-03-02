//
//  TabBarDashboard.swift
//  HomeHealthPro
//
//  Created by Ankit on 28/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class TabBarDashboard: UITabBarController {

    @IBOutlet weak var tabBarDashbard: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
    }
}

extension TabBarDashboard {
    func initialSetting() {
        tabBarDashbard.addGradientTo(startColor: UIColor.startGradientColor, endColor: UIColor.endGradientColor, isVertical: true)
        for tabBarItems:UITabBarItem in tabBarDashbard.items! {
            let attributes = [NSAttributedString.Key.font:UIFont(name: "SFProDisplay-Regular", size: 13)]
            tabBarItems.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        }
    }
}
