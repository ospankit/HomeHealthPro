//
//  DashBoardCollectionViewCell.swift
//  HomeHealthPro
//
//  Created by Ankit on 02/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class DashBoardCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var dashBoardCountButton: UIButton!
    @IBOutlet weak var dashBoardTotalLabel: UILabel!
    
    func dashboardCollectionViewInitialSetting() {
        dashBoardCountButton.addBorderWithCircleColor(width: 2.2)
        dashBoardCountButton.makeCornerRadius(raidus: dashBoardCountButton.frame.size.height/2.2)
        dashBoardCountButton.isUserInteractionEnabled = false
        tintColor = UIColor.colorPrimary
        backgroundColor = UIColor.white
        dashBoardTotalLabel.textColor = UIColor.colorPrimaryDark
    }
}
