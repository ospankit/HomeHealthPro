//
//  MainContainerController.swift
//  HomeHealthPro
//
//  Created by Ankit on 04/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class MainContainerController: UIViewController {
    
    let transition = CATransition()

    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet var mainView: UIView!
    
    var navController : DashBoardNavigation?
    
    let viewModel = MainControllerViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        navController = segue.destination as? DashBoardNavigation
    }
    
    @IBAction func menuAction(_ sender: UIBarButtonItem) {
        let dashBoardSideMenu = storyboard?.instantiateViewController(identifier: Controller.DashBoardSideMenuVC.identifier) as! DashBoardSideMenuVC
        dashBoardSideMenu.didTapMenuType = { MenuType in
            self.pushMenuTapToView(menuType: MenuType)
        }
        dashBoardSideMenu.modalPresentationStyle = .overCurrentContext
        menuTransitaionIN()
        present(dashBoardSideMenu, animated: false, completion: nil)
    }
    
    func menuTransitaionIN() {
        transition.duration = 0.5
        transition.type = CATransitionType.reveal
        transition.subtype = CATransitionSubtype.fromLeft
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.linear)
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func menuTransitaionOUT() {
        transition.duration = 0.5
        transition.type = CATransitionType.moveIn
        transition.subtype = CATransitionSubtype.fromRight
        transition.timingFunction = CAMediaTimingFunction(name:CAMediaTimingFunctionName.easeOut)
        view.window!.layer.add(transition, forKey: kCATransition)
    }
    
    func showDashBoard() {
        let destination = storyboard?.instantiateViewController(identifier: Controller.tabBarDashboard.identifier) as! TabBarDashboard
        destination.setSelectedIndex = 0
        navController?.pushViewController(destination, animated: false)
    }
    
    func pushMenuTapToView(menuType:MenuType) {
        switch menuType {
        case .Dashboard:
            menuButton.isHidden = false
            menuTransitaionOUT()
            dismiss(animated: false, completion: nil)
        case .Clinicians:
            menuButton.isHidden = true
            let destination = navController?.tabController
            //let destination = storyboard?.instantiateViewController(identifier: Controller.tabBarDashboard.identifier) as! TabBarDashboard
            //destination?.setSelectedIndex = 1
            //destination?.initialSetting()
            //navController?.pushViewController(destination, animated: true)
            print(destination)
            menuTransitaionOUT()
            dismiss(animated: false, completion: nil)
        case .Patients:
            menuTransitaionOUT()
            dismiss(animated: false, completion: nil)
        case .MyAccount:
            menuButton.isHidden = true
            let destination = storyboard?.instantiateViewController(identifier: Controller.tabBarDashboard.identifier) as! TabBarDashboard
            destination.setSelectedIndex = 3
            navController?.pushViewController(destination, animated: true)
            menuTransitaionOUT()
            dismiss(animated: true, completion: nil)
        case .Logout:
            self.viewModel.logoutInitiated()
        }
    }
}

extension MainContainerController: hideMenuButtonProtocol{
    func unhideMenuButton() {
        menuButton.isHidden = false
    }
    
    func hideMenuButton() {
        menuButton.isHidden = true
    }
    
    func hideMenuButton(title: String) {
        if title == imageConstant.Dashboard.identifier {
            menuButton.isHidden = false
        }else {
            menuButton.isHidden = true
        }
    }
}

extension MainContainerController : MainControllerViewModelProtocol {
    func showActivityIndicator() {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showIndicator(view: self)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            ActivityIndicator.shared.hideActivity()
        }
    }
    
    func showMessage(message: String) {
        DispatchQueue.main.async {
            Alert.sharedInstance.alertOkView(viewController: self, message: message)
        }
    }
    
    func logoutOutSucess() {
        GeneralUserDefaultsManager.sharedInstance.cleanLoginData()
        DispatchQueue.main.async {
            let vc = UIStoryboard.init(name: StoryBoard.Login.indentifier, bundle: nil).instantiateViewController(identifier: Controller.LoginVc.identifier) as! LoginVc
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
            
        }
    }
        
}
