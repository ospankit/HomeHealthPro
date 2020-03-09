//
//  TabBarDashboard.swift
//  HomeHealthPro
//
//  Created by Ankit on 28/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

protocol hideMenuButtonProtocol {
    func hideMenuButton(title:String)
    func hideMenuButton()
    func unhideMenuButton()
}

class TabBarDashboard: UITabBarController{

    @IBOutlet weak var tabBarDashbard: UITabBar!
    
    var setSelectedIndex = 0
    
    var hideMenuButtonDelegate : hideMenuButtonProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
    }
    
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        self.hideMenuButtonDelegate?.hideMenuButton(title: item.title!)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.hideMenuButtonDelegate?.hideMenuButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.hideMenuButtonDelegate?.unhideMenuButton()
    }
    
}

extension TabBarDashboard {
    func initialSetting() {
        tabBarDashbard.addGradientTo(startColor: UIColor.startGradientColor, endColor: UIColor.endGradientColor, isVertical: true)
        for tabBarItems:UITabBarItem in tabBarDashbard.items! {
            let attributes = [NSAttributedString.Key.font:UIFont(name: fontConstant.SFProDisplayRegular.identifier, size: 13)]
            tabBarItems.setTitleTextAttributes(attributes as [NSAttributedString.Key : Any], for: .normal)
        }
        
        self.selectedIndex = setSelectedIndex
        
        let mainContainerController = UIApplication.shared.windows.first?.rootViewController as! MainContainerController
        self.hideMenuButtonDelegate = mainContainerController
    }
}
