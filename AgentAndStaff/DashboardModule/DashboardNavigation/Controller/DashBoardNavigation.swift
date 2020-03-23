//
//  DashBoardNavigation.swift
//  HomeHealthPro
//
//  Created by Ankit on 04/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class DashBoardNavigation: UINavigationController {
    
    var tabController : TabBarDashboard?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        tabController = segue.destination as? TabBarDashboard
    }

}
