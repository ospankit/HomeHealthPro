//
//  ScheduleVisitVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 11/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class ScheduleVisitPatientDetailVC: UIViewController {

    @IBOutlet weak var patientDetailSearchView: UIView!
    @IBOutlet weak var patientDetailSearchTextField: UITextField!
    @IBOutlet weak var patientDetailView: UIView!
    @IBOutlet weak var patientsDetailsButton
    : UIButton!
    @IBOutlet weak var visitDetailsButton
    : UIButton!
    @IBOutlet weak var selectClinicianButton
    : UIButton!
    @IBOutlet weak var patientInformationLabel: UILabel!
    @IBOutlet weak var pateintNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var patientTypeTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var patientDobTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var patientContactNumberTextfield: SkyFloatingLabelTextField!
    @IBOutlet weak var patientsEmailAddressTextfield: SkyFloatingLabelTextField!
    @IBOutlet weak var patientEmergencyContactNameTextfield: SkyFloatingLabelTextField!
    @IBOutlet weak var patientGenderTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var patientEmergencyContactNumberTextfield: SkyFloatingLabelTextField!
    @IBOutlet weak var patientAddressLineTextfield: SkyFloatingLabelTextField!
    @IBOutlet weak var patientDiagnosisTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var patientInsranceTypeTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var scheduleVisitPageView : ScheduleVisitPageViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfScheduleVisitPatientDetailVC()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func scheduleVisitBackAction(_ sender: Any) {
        let mainContainerController = UIApplication.shared.windows.first?.rootViewController as! MainContainerController
        mainContainerController.showDashBoard()
    }
    
    @IBAction func patientDetailNextButton(_ sender: Any) {
        scheduleVisitPageView = self.parent as? ScheduleVisitPageViewController
        if let vc = scheduleVisitPageView?.showViewController[1] {
            scheduleVisitPageView?.backAndForwardActionPageViewController(viewController: vc)
        }
    }
}

extension ScheduleVisitPatientDetailVC {
    func initialSettingOfScheduleVisitPatientDetailVC() {
        //button color
        patientsDetailsButton.tintColor = .white
        patientsDetailsButton.makeCornerRadius(raidus: patientsDetailsButton.frame.size.height/2)
        patientsDetailsButton.addGradientToButton(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: false)
        
        nextButton.tintColor = .white
        nextButton.makeCornerRadius(raidus: nextButton.frame.size.height/2)
        nextButton.addGradientToButton(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: false)
        
        resetButton.tintColor = .colorPrimaryDark
        resetButton.addBorderWithGraigent(startColor: .startGradientColor, endColor: .endGradientColor)
        
        visitDetailsButton.tintColor = .fpGrey
        selectClinicianButton.tintColor = .fpGrey
        
        //label color
        patientInformationLabel.textColor = .colorPrimaryDark
        
        //textField color
        patientDetailSearchTextField.backgroundColor = .bagroundGrey
        
        //textfield make cornerRadius
        patientDetailSearchTextField.makeCornerRadius(raidus: patientDetailSearchTextField.frame.size.height/2)
        
        //textfield search image
        patientDetailSearchTextField.addBorder(width: 0.5)
        patientDetailSearchTextField.leftPadding(paddingSize: 10)
        let searchImage = UIImageView(frame: CGRect(x: 10, y: 5, width: 20, height: 20))
        searchImage.contentMode = .scaleAspectFit
        searchImage.image = UIImage(named: imageConstant.Search.identifier)
        let searchImageContainerView = UIView(frame: CGRect(x: 0, y: 0, width: 40, height: 30))
        searchImageContainerView.addSubview(searchImage)
        patientDetailSearchTextField.leftView = searchImageContainerView
        patientDetailSearchTextField.rightViewMode = .unlessEditing
        
        //searchView shadow
        patientDetailSearchView.dropShadow()
        
        //view color
        patientDetailView.backgroundColor = .bagroundGrey
        
        //textField Color
        pateintNameTextField.selectedLineColor = UIColor.colorPrimary
        pateintNameTextField.selectedTitleColor = UIColor.colorPrimary
        pateintNameTextField.textColor = UIColor.colorPrimaryDark
        pateintNameTextField.tintColor = UIColor.colorPrimary
        
        patientContactNumberTextfield.selectedLineColor = UIColor.colorPrimary
        patientContactNumberTextfield.selectedTitleColor = UIColor.colorPrimary
        patientContactNumberTextfield.textColor = UIColor.colorPrimaryDark
        patientContactNumberTextfield.tintColor = UIColor.colorPrimary
        
        patientsEmailAddressTextfield.selectedLineColor = UIColor.colorPrimary
        patientsEmailAddressTextfield.selectedTitleColor = UIColor.colorPrimary
        patientsEmailAddressTextfield.textColor = UIColor.colorPrimaryDark
        patientsEmailAddressTextfield.tintColor = UIColor.colorPrimary
        
        patientEmergencyContactNameTextfield.selectedLineColor = UIColor.colorPrimary
        patientEmergencyContactNameTextfield.selectedTitleColor = UIColor.colorPrimary
        patientEmergencyContactNameTextfield.textColor = UIColor.colorPrimaryDark
        patientEmergencyContactNameTextfield.tintColor = UIColor.colorPrimary
        
        patientEmergencyContactNumberTextfield.selectedLineColor = UIColor.colorPrimary
        patientEmergencyContactNumberTextfield.selectedTitleColor = UIColor.colorPrimary
        patientEmergencyContactNumberTextfield.textColor = UIColor.colorPrimaryDark
        patientEmergencyContactNumberTextfield.tintColor = UIColor.colorPrimary
        
        patientAddressLineTextfield.selectedLineColor = UIColor.colorPrimary
        patientAddressLineTextfield.selectedTitleColor = UIColor.colorPrimary
        patientAddressLineTextfield.textColor = UIColor.colorPrimaryDark
        patientAddressLineTextfield.tintColor = UIColor.colorPrimary
        
        patientDiagnosisTextField.selectedLineColor = UIColor.colorPrimary
        patientDiagnosisTextField.selectedTitleColor = UIColor.colorPrimary
        patientDiagnosisTextField.textColor = UIColor.colorPrimaryDark
        patientDiagnosisTextField.tintColor = UIColor.colorPrimary
        
        patientInsranceTypeTextField.selectedLineColor = UIColor.colorPrimary
        patientInsranceTypeTextField.selectedTitleColor = UIColor.colorPrimary
        patientInsranceTypeTextField.textColor = UIColor.colorPrimaryDark
        patientInsranceTypeTextField.tintColor = UIColor.colorPrimary
    }
}
