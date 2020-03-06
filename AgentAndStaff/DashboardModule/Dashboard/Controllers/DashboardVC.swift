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
    let transition = CATransition()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingoOfDashboardVc()
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
        cell.dashboardCollectionViewInitialSetting()
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
