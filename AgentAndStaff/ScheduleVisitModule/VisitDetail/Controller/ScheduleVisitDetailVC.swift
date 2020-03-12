//
//  ScheduleVisitDetailVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 12/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class ScheduleVisitDetailVC: UIViewController {

    @IBOutlet weak var ScheduleVisitDetailSearchView: UIView!
    @IBOutlet weak var patientDetailsButton: UIButton!
    @IBOutlet weak var visitDetailButton: UIButton!
    @IBOutlet weak var selectClinicianButton: UIButton!
    @IBOutlet weak var visitInformationLabel: UILabel!
    @IBOutlet weak var visitInformationView: UIView!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var saveAndSearchClinicianButton: UIButton!
    
    @IBOutlet weak var maxVisitFeesTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var visitFrequencyTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var numberOfVisitTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var visitZipCodeTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var agencyNotestextField: SkyFloatingLabelTextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfScheduleVisitDetailVC()
    }
    @IBAction func scheduleVisitDetailsBackButtonAction(_ sender: Any) {
        var scheduleVisitPageView : ScheduleVisitPageViewController?
        scheduleVisitPageView = self.parent as? ScheduleVisitPageViewController
        if let vc = scheduleVisitPageView?.showViewController.first {
        scheduleVisitPageView?.backAndForwardActionPageViewController(viewController: vc)
        }
    }
    
}

extension ScheduleVisitDetailVC {
    func initialSettingOfScheduleVisitDetailVC() {
        //button color
        patientDetailsButton.tintColor = .fpGrey
        
        selectClinicianButton.tintColor = .fpGrey
        
        visitDetailButton.tintColor = .white
        visitDetailButton.makeCornerRadius(raidus: visitDetailButton.frame.size.height/2)
        visitDetailButton.addGradientToButton(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: false)
        
        saveAndSearchClinicianButton.tintColor = .white
        saveAndSearchClinicianButton.makeCornerRadius(raidus: visitDetailButton.frame.size.height/1.5)
        saveAndSearchClinicianButton.addGradientToButton(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: false)
        
        backButton.tintColor = .colorPrimaryDark
        backButton.addBorderWithGraigent(startColor: .startGradientColor, endColor: .endGradientColor)
        
        //view color
        visitInformationView.backgroundColor = .bagroundGrey
        
        //label color
        visitInformationLabel.textColor = .colorPrimaryDark
        
        //view shadow
        ScheduleVisitDetailSearchView.dropShadow()
        
        //textfield setting
        maxVisitFeesTextField.selectedLineColor = UIColor.colorPrimary
        maxVisitFeesTextField.selectedTitleColor = UIColor.colorPrimary
        maxVisitFeesTextField.textColor = UIColor.colorPrimaryDark
        maxVisitFeesTextField.tintColor = UIColor.colorPrimary
        
        visitFrequencyTextField.selectedLineColor = UIColor.colorPrimary
        visitFrequencyTextField.selectedTitleColor = UIColor.colorPrimary
        visitFrequencyTextField.textColor = UIColor.colorPrimaryDark
        visitFrequencyTextField.tintColor = UIColor.colorPrimary
        
        numberOfVisitTextField.selectedLineColor = UIColor.colorPrimary
        numberOfVisitTextField.selectedTitleColor = UIColor.colorPrimary
        numberOfVisitTextField.textColor = UIColor.colorPrimaryDark
        numberOfVisitTextField.tintColor = UIColor.colorPrimary
        
        visitZipCodeTextField.selectedLineColor = UIColor.colorPrimary
        visitZipCodeTextField.selectedTitleColor = UIColor.colorPrimary
        visitZipCodeTextField.textColor = UIColor.colorPrimaryDark
        visitZipCodeTextField.tintColor = UIColor.colorPrimary
        
        agencyNotestextField.selectedLineColor = UIColor.colorPrimary
        agencyNotestextField.selectedTitleColor = UIColor.colorPrimary
        agencyNotestextField.textColor = UIColor.colorPrimaryDark
        agencyNotestextField.tintColor = UIColor.colorPrimary
        
    }
}
