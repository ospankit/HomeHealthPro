//
//  DashboardVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 28/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    
    @IBOutlet weak var addBalanceButton: UIButton!
    @IBOutlet weak var dashBoardUpperView: UIView!
    @IBOutlet weak var dashBoardBalanceLabel: UILabel!
    @IBOutlet weak var dashBooardCollectionView: UICollectionView!
    @IBOutlet weak var dashBoardBalanceNameLabel: UILabel!
    let transition = CATransition()
    let dashboardLabelArray = ["Total Patients","Total Clinicians","Visits Scheduled","Pending Visits"]
    
    let viewModel = DashboardViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingoOfDashboardVc()
        viewModel.delegate = self
        let agencyDashboardRequest = AgencyDashboardRequest(ClinicianId: "", FromDate: "", ToDate: "")
        viewModel.getDashBoardData(param:agencyDashboardRequest)
    }
}

extension DashboardVC {
    func initialSettingoOfDashboardVc(){
        //setting collection view color
        dashBooardCollectionView.backgroundColor = UIColor.lineSeperator
        
        //adding gradient to view
        self.view.addGradientTo(startColor: UIColor.endGradientColor, endColor: UIColor.startGradientColor, isVertical: true)
        dashBoardUpperView.addGradientTo(startColor: UIColor.endGradientColor, endColor: UIColor.startGradientColor, isVertical: true)
        
        //making collectionview corner circle
        dashBooardCollectionView.makeTopCornerRadius(raidus: self.view.frame.width/10)
        
        //addcornerRadius to addBalanceButton
        addBalanceButton.makeCornerRadius(raidus: addBalanceButton.frame.size.height/2)
        
        //reloading collection view
        dashBooardCollectionView.reloadData()
    }
}

extension DashboardVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (viewModel.dashboardResponse?.data.dashboardTotalCounterCards.count ?? 0)-1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Controller.DashBoardCollectionViewCell.identifier, for: indexPath) as! DashBoardCollectionViewCell
        cell.dashboardCollectionViewInitialSetting()
        cell.dashBoardTotalLabel.text = viewModel.dashboardResponse?.data.dashboardTotalCounterCards[indexPath.row].key
        cell.dashBoardCountButton.setTitle(viewModel.dashboardResponse?.data.dashboardTotalCounterCards[indexPath.row].value, for: .normal)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return(CGSize(width: (collectionView.frame.size.width/2)-0.5, height: (collectionView.frame.size.height/2)-1))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath == IndexPath(row: 0, section: 0) {
            let vc = UIStoryboard(name: StoryBoard.patients.indentifier, bundle: nil).instantiateViewController(identifier: Controller.AssignedPatients.identifier) as! AssignedPatients
            navigationController?.pushViewController(vc, animated: false)
        }else if indexPath == IndexPath(row: 1, section: 0){
            let tabBar = self.parent as? TabBarDashboard
            tabBar?.setSelectedIndex = 1
            tabBar?.initialSetting()
        }else if indexPath == IndexPath(row: 2, section: 0){
            print("visit scheduled")
        }else if indexPath == IndexPath(row: 3, section: 0){
            print("visit pending")
        }
    }
}

extension DashboardVC : DashboardViewModelProtocol {
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
    
    func dashboardDataSucess() {
        DispatchQueue.main.async {
            self.dashBooardCollectionView.reloadData()
            self.dashBoardBalanceNameLabel.text = self.viewModel.dashboardResponse?.data.dashboardTotalCounterCards[4].key
            self.dashBoardBalanceLabel.text = self.viewModel.dashboardResponse?.data.dashboardTotalCounterCards[4].value
        }
    }
    
    
}
