//
//  DashBoardSideMenuVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 02/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

enum MenuType:Int {
    case Dashboard
    case Clinicians
    case Patients
    case MyAccount
    case Logout
}

class DashBoardSideMenuVC: UIViewController {

    @IBOutlet weak var dashBoardSideMenuView: UIView!
    let dashBoardSideMenuLabelNameArray = ["Dashboard","Clinicians","Patients","My Account","Logout"]
    @IBOutlet weak var dashBoardSideMenuTableView: UITableView!
    let transition = CATransition()
    
    var didTapMenuType :((MenuType) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        dashBoardSideMenuView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = touches.first
        if touch?.view == dashBoardSideMenuView {
            menuTransitaionOUT()
            self.navigationController?.isNavigationBarHidden = false
            dismiss(animated: false, completion: nil)
        }
    }
}

extension DashBoardSideMenuVC {
    func menuTransitaionOUT() {
        transition.duration = 0.5
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        view.window!.layer.add(transition, forKey: kCATransition)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let menuCase = MenuType(rawValue: indexPath.row) else {return}
        self.didTapMenuType?(menuCase)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
