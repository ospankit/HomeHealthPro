//
//  PatientsDetailsTableCell.swift
//  HomeHealthPro
//
//  Created by Ankit on 09/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class PatientsDetailsTableCell: UITableViewCell {

    @IBOutlet weak var scheduleVisitButton: UIButton!
    @IBOutlet weak var patientsDetailsView: UIView!
    @IBOutlet weak var zipCodeLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var dateOfBirthLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var clinicianLabel: UILabel!
    @IBOutlet weak var patientNameLabel: UILabel!
    
    func initialSettingOfPatientsDetailsTableCell(){
        //color to label
        patientNameLabel.textColor = .colorPrimaryDark
        zipCodeLabel.textColor = .fpGrey
        genderLabel.textColor = .fpGrey
        dateOfBirthLabel.textColor = .fpGrey
        emailLabel.textColor = .fpGrey
        contactLabel.textColor = .fpGrey
        clinicianLabel.textColor = .fpGrey
        
        //patientsDetailsView corner radius
        patientsDetailsView.makeCornerRadius(raidus: patientsDetailsView.frame.size.height/40)
        //patientsDetailsView.dropShadowAllSide(color: .lightGray, offSet: CGSize(width: 0.5, height: 0.5))
        
        //button cornerRadius
        scheduleVisitButton.tintColor = UIColor.colorPrimary
        scheduleVisitButton.addBorderWithGraigent(startColor: .startGradientColor, endColor: .endGradientColor)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
