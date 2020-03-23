//
//  ClinicianCollectionCell.swift
//  HomeHealthPro
//
//  Created by Ankit on 06/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit
import Cosmos
import Kingfisher

class ClinicianCollectionCell: UICollectionViewCell {
    @IBOutlet weak var clinicianCollectionImageView: UIImageView!
    @IBOutlet weak var clinicianColletionDrNameLabel: UILabel!
    @IBOutlet weak var clinicianColletionDrBranchLabel: UILabel!
    @IBOutlet weak var ratingStarView: CosmosView!
    @IBOutlet weak var clinicianColletionReviewLabel: UILabel!
    @IBOutlet weak var clinicianColletionAddressLabel: UILabel!
    @IBOutlet weak var clinicianColletionBGCheckLabel: UILabel!
    @IBOutlet weak var clinicianColletionChargeLabel: UILabel!
    @IBOutlet weak var clinicianColletionCheckButton: UIButton!
    @IBOutlet weak var clinicianColletionScheduleVisitButton: UIButton!
    
    let attributeColorBlackRegular = [NSAttributedString.Key.foregroundColor : UIColor.black]
    let attributeColorRedBold = [NSAttributedString.Key.foregroundColor : UIColor.systemRed]
    let attributeColorGreenBold = [NSAttributedString.Key.foregroundColor: UIColor.systemGreen]
    
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
    
    func setData(data:ClinicianData){
        clinicianColletionDrNameLabel.text = data.fullName
        clinicianColletionDrBranchLabel.text = data.patientType
        ratingStarView.rating = Double(data.averageRating)
        clinicianColletionReviewLabel.text = "(\(data.averageRating)/\(data.totalRatings) Reviews)"
        clinicianColletionAddressLabel.text = data.addressLine
        clinicianColletionChargeLabel.text = "$\(Double(data.perVisitRate).rounded(toPlaces: 2))"
        let finalBGCheckLabel = NSMutableAttributedString()
        if data.backgroudVerficationStatus {
            let bgCheckLabel = NSAttributedString(string: "B/G Check: ", attributes: attributeColorBlackRegular)
            let bgCheckDone = NSAttributedString(string: " Done", attributes: attributeColorGreenBold)
            finalBGCheckLabel.append(bgCheckLabel)
            finalBGCheckLabel.append(bgCheckDone)
            clinicianColletionBGCheckLabel.attributedText = finalBGCheckLabel
        }else{
            let bgCheckLabel = NSAttributedString(string: "B/G Check: ", attributes: attributeColorBlackRegular)
            let bgCheckPending = NSAttributedString(string: " Pending", attributes: attributeColorRedBold)
            finalBGCheckLabel.append(bgCheckLabel)
            finalBGCheckLabel.append(bgCheckPending)
            clinicianColletionBGCheckLabel.attributedText = finalBGCheckLabel
        }
        let imageUrl = data.profileImage.noBackwardSlashToForward()
        let noSpaceImageUrl = imageUrl.spaceTo()
        let finalUrl = URL(string: BaseUrl.baseUrl.baseUrlString + noSpaceImageUrl)!
        clinicianCollectionImageView.kf.setImage(with: finalUrl)
    }
}

extension Double {
    func rounded(toPlaces places:Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}
