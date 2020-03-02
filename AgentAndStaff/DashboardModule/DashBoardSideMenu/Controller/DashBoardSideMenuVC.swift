//
//  DashBoardSideMenuVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 02/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class DashBoardSideMenuVC: UIViewController {

    let dashBoardSideMenuLabelNameArray = ["Dashboard","Clinicians","Patients","My Account","Logout"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension DashBoardSideMenuVC : UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dashBoardSideMenuLabelNameArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Controller.DashBoardSideMenuTableViewCell.identifier) as! DashBoardSideMenuTableViewCell
        cell.dashBoardSideMenuLabel.text = dashBoardSideMenuLabelNameArray[indexPath.row]
        return cell
    }
}
