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
    @IBOutlet weak var dashBooardCollectionView: UICollectionView!
    let transition = SlideInTransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingoOfDashboardVc()
    }
    
    //mark: dashBoard menu action
    @IBAction func dashBoardMenuAction(_ sender: Any) {
        let dashBoardSideMenu = storyboard?.instantiateViewController(identifier: Controller.DashBoardSideMenuVC.identifier) as! DashBoardSideMenuVC
        /*menuViewController.didTapMenuType = { MenuType in
            self.pushMenuTapToView(menuType: MenuType)
        }*/
        dashBoardSideMenu.modalPresentationStyle = .overCurrentContext
        dashBoardSideMenu.transitioningDelegate = self
        present(dashBoardSideMenu, animated: true)
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
    }
}

extension DashboardVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Controller.DashBoardCollectionViewCell.identifier, for: indexPath) as! DashBoardCollectionViewCell
        cell.dashBoardCountButton.addBorderWithCircleColor(width: 2)
        cell.dashBoardCountButton.makeCornerRadius(raidus: collectionView.frame.size.width/6)
        cell.dashBoardCountButton.isUserInteractionEnabled = false
        cell.tintColor = UIColor.colorPrimary
        cell.backgroundColor = UIColor.white
        cell.dashBoardTotalLabel.textColor = UIColor.colorPrimaryDark
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
}

extension DashboardVC: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}
