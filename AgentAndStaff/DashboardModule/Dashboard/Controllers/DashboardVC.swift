//
//  DashboardVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 28/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class DashboardVC: UIViewController {
    
    @IBOutlet weak var dashBooardCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingoOfDashboardVc()
    }
}

extension DashboardVC {
    func initialSettingoOfDashboardVc(){
        //setting collection view color
        dashBooardCollectionView.backgroundColor = UIColor.bagroundGrey
        
        //making collectionview corner circle
        dashBooardCollectionView.makeTopCornerRadius(raidus: self.view.frame.width/10)
        
        //adding gradient to view
        self.view.addGradientTo(startColor: UIColor.endGradientColor, endColor: UIColor.startGradientColor, isVertical: true)
    }
}

extension DashboardVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DashBoardCollectionViewCell", for: indexPath) as! DashBoardCollectionViewCell
        cell.dashBoardCountButton.addBorderWithBackGroundGrey(width: 1)
        cell.dashBoardCountButton.makeCornerRadius(raidus: collectionView.frame.size.width/6)
        cell.tintColor = UIColor.colorPrimary
        cell.backgroundColor = UIColor.white
        cell.dashBoardTotalLabel.textColor = UIColor.colorPrimaryDark
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return(CGSize(width: (collectionView.frame.size.width/2)-0.19, height: (collectionView.frame.size.height/2)))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.19
    }
}
