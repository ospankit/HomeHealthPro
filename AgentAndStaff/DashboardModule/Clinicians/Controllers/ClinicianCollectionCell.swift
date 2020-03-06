//
//  ClinicianCollectionCell.swift
//  HomeHealthPro
//
//  Created by Ankit on 06/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class ClinicianCollectionCell: UICollectionViewCell {
    @IBOutlet weak var clinicianCollectionImageView: UIImageView!
    @IBOutlet weak var clinicianColletionDrNameLabel: UILabel!
    @IBOutlet weak var clinicianColletionDrBranchLabel: UILabel!
    @IBOutlet weak var clinicianColletionReviewLabel: UILabel!
    @IBOutlet weak var clinicianColletionAddressLabel: UILabel!
    @IBOutlet weak var clinicianColletionBGCheckLabel: UILabel!
    @IBOutlet weak var clinicianColletionChargeLabel: UILabel!
    @IBOutlet weak var clinicianColletionCheckButton: UIButton!
    @IBOutlet weak var clinicianColletionScheduleVisitButton: UIButton!
    
    func initalSetting() {
        clinicianCollectionImageView.makeCornerRadius(raidus: clinicianCollectionImageView.frame.size.height/2)
        clinicianColletionDrNameLabel.textColor = UIColor.colorPrimaryDark
        clinicianColletionDrBranchLabel.textColor = UIColor.colorPrimaryDark
        clinicianColletionChargeLabel.textColor = UIColor.colorPrimaryDark
        clinicianColletionReviewLabel.textColor = UIColor.fpGrey
        clinicianColletionAddressLabel.textColor = UIColor.fpGrey
        clinicianColletionScheduleVisitButton.tintColor = UIColor.colorPrimary
        clinicianColletionScheduleVisitButton.addBorderWithGraigent(startColor: .startGradientColor, endColor: .endGradientColor)
        clinicianColletionCheckButton.addBorderWithCircleColor(width: 1)
        clinicianColletionCheckButton.makeCornerRadius(raidus: clinicianColletionCheckButton.frame.size.height/2)
        
    }
}
