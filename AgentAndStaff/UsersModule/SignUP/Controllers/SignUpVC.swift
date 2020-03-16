//
//  SignUpVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 27/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit
import DropDown

class SignUpVC: UIViewController {

    @IBOutlet weak var signUpMainLabel: UILabel!
    @IBOutlet weak var createYourAccountLabel: UILabel!
    @IBOutlet weak var agencyNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var cityNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var stateNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var zipcodeNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var agencyTypeView: UIView!
    @IBOutlet weak var agencyTypetextField: SkyFloatingLabelTextField!
    @IBOutlet weak var contactPersonNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneLandlineNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailAddressTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var faxNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var addressLineTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var alreadyHaveAnAccountLabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var iAcceptLabel: UILabel!
    var passwordHideShowButton = UIButton(type: .custom)
    var isSecureTextEntry = true
    
    let dropDownAgency = DropDown()
    let dropDownCity = DropDown()
    
    var agencyData = [dataArray]()
    var cityData = [dataArray]()
    
    var viewModel = signUpViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfSignUpVC()
        viewModel.delegate = self
        let agencyTypeRequest = masterList(Type: "AgencyType", CityId: 0, StateId: 0)
        viewModel.getInitialAgencyData(param: agencyTypeRequest)
        let cityTypeRequest = masterList(Type: "City", CityId: 0, StateId: 0)
        viewModel.getInitialAgencyData(param: cityTypeRequest)
    }
    
    @IBAction func agencyTypeAction(_ sender: Any) {
        dropDownAgency.show()
        dropDownAgency.selectionAction = { [unowned self] (index: Int, item: String) in
            self.agencyTypetextField.text = item
            self.agencyTypetextField.selectedLineColor = UIColor.colorPrimary
            self.agencyTypetextField.selectedTitleColor = UIColor.colorPrimary
            self.agencyTypetextField.textColor = UIColor.colorPrimaryDark
            self.agencyTypetextField.tintColor = UIColor.colorPrimary
        }
    }
    @IBAction func cityTypeAction(_ sender: Any) {
        dropDownCity.show()
        dropDownCity.selectionAction = { [unowned self] (index: Int, item: String) in
            self.cityNameTextField.text = item
            self.cityNameTextField.selectedLineColor = UIColor.colorPrimary
            self.cityNameTextField.selectedTitleColor = UIColor.colorPrimary
            self.cityNameTextField.textColor = UIColor.colorPrimaryDark
            self.cityNameTextField.tintColor = UIColor.colorPrimary
        }
    }
    @IBAction func stateTypeAction(_ sender: Any) {
        /*dropDownAgency.show()
        dropDownAgency.selectionAction = { [unowned self] (index: Int, item: String) in
            self.agencyTypetextField.text = item
            self.agencyTypetextField.selectedLineColor = UIColor.colorPrimary
            self.agencyTypetextField.selectedTitleColor = UIColor.colorPrimary
            self.agencyTypetextField.textColor = UIColor.colorPrimaryDark
            self.agencyTypetextField.tintColor = UIColor.colorPrimary
        }*/
    }
    @IBAction func zipcodeTypeAction(_ sender: Any) {
        /*dropDownAgency.show()
        dropDownAgency.selectionAction = { [unowned self] (index: Int, item: String) in
            self.agencyTypetextField.text = item
            self.agencyTypetextField.selectedLineColor = UIColor.colorPrimary
            self.agencyTypetextField.selectedTitleColor = UIColor.colorPrimary
            self.agencyTypetextField.textColor = UIColor.colorPrimaryDark
            self.agencyTypetextField.tintColor = UIColor.colorPrimary
        }*/
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
}

extension SignUpVC {
    //setting view backGroundColor
    func initialSettingOfSignUpVC() {
        //setting color
        signUpMainLabel.textColor = UIColor.colorPrimaryDark
        createYourAccountLabel.textColor = UIColor.fpGrey
        agencyNameTextField.selectedLineColor = UIColor.colorPrimary
        agencyNameTextField.selectedTitleColor = UIColor.colorPrimary
        agencyNameTextField.textColor = UIColor.colorPrimaryDark
        agencyNameTextField.tintColor = UIColor.colorPrimary
        contactPersonNameTextField.selectedLineColor = UIColor.colorPrimary
        contactPersonNameTextField.selectedTitleColor = UIColor.colorPrimary
        contactPersonNameTextField.textColor = UIColor.colorPrimaryDark
        contactPersonNameTextField.tintColor = UIColor.colorPrimary
        agencyTypetextField.selectedLineColor = UIColor.colorPrimary
        agencyTypetextField.selectedTitleColor = UIColor.colorPrimary
        agencyTypetextField.textColor = UIColor.colorPrimaryDark
        agencyTypetextField.tintColor = UIColor.colorPrimary
        phoneLandlineNumberTextField.selectedLineColor = UIColor.colorPrimary
        phoneLandlineNumberTextField.selectedTitleColor = UIColor.colorPrimary
        phoneLandlineNumberTextField.textColor = UIColor.colorPrimaryDark
        phoneLandlineNumberTextField.tintColor = UIColor.colorPrimary
        emailAddressTextField.selectedLineColor = UIColor.colorPrimary
        emailAddressTextField.selectedTitleColor = UIColor.colorPrimary
        emailAddressTextField.textColor = UIColor.colorPrimaryDark
        emailAddressTextField.tintColor = UIColor.colorPrimary
        faxNumberTextField.selectedLineColor = UIColor.colorPrimary
        faxNumberTextField.selectedTitleColor = UIColor.colorPrimary
        faxNumberTextField.textColor = UIColor.colorPrimaryDark
        faxNumberTextField.tintColor = UIColor.colorPrimary
        passwordTextField.selectedLineColor = UIColor.colorPrimary
        passwordTextField.selectedTitleColor = UIColor.colorPrimary
        passwordTextField.textColor = UIColor.colorPrimaryDark
        passwordTextField.tintColor = UIColor.colorPrimary
        addressLineTextField.selectedLineColor = UIColor.colorPrimary
        addressLineTextField.selectedTitleColor = UIColor.colorPrimary
        addressLineTextField.textColor = UIColor.colorPrimaryDark
        addressLineTextField.tintColor = UIColor.colorPrimary
        alreadyHaveAnAccountLabel.textColor = UIColor.colorPrimary
        signInButton.tintColor = UIColor.colorPrimaryDark
        
        //corner radius to button
        let cornerRadiusValue = signUpButton.frame.height/2
        signUpButton.makeCornerRadius(raidus: cornerRadiusValue)
        
        //gradient to button
        signUpButton.addGradientTo(startColor: UIColor.startGradientColor, endColor: UIColor.endGradientColor, isVertical: false)
        
        //middle color change for
        let attributes = [NSAttributedString.Key.foregroundColor : UIColor.colorPrimary]
        let attributedString = NSAttributedString(string: Constant.termsAndCondition.identifier, attributes: attributes)
        let simplesttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        let mainText = NSAttributedString(string: Constant.iAcceptAllThe.identifier, attributes: simplesttributes)
        let lastMainText = NSAttributedString(string: Constant.toAccessThisApplication.identifier , attributes: simplesttributes)
        let finalString = NSMutableAttributedString()
        finalString.append(mainText)
        finalString.append(attributedString)
        finalString.append(lastMainText)
        iAcceptLabel.attributedText = finalString
        
        //adding button to passwordtextfield
        passwordHideShowButton.addTarget(self, action: #selector(hideShowPassword), for: .touchUpInside)
        passwordHideShowButton.frame(forAlignmentRect: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(30), height: passwordTextField.bounds.height))
        passwordHideShowButton.setBackgroundImage(UIImage(named: Constant.Invisible.identifier), for: .normal)
        passwordTextField.rightViewMode = .always
        passwordTextField.rightView = passwordHideShowButton
        
        //hiding data of passordTextfield
        passwordTextField.isSecureTextEntry = true
        
    }
    
    @objc func hideShowPassword() {
        if isSecureTextEntry {
            passwordTextField.isSecureTextEntry = false
            passwordHideShowButton.setBackgroundImage(UIImage(named: Constant.Visible.identifier), for: .normal)
        }else {
            passwordTextField.isSecureTextEntry = true
            passwordHideShowButton.setBackgroundImage(UIImage(named: Constant.Invisible.identifier), for: .normal)
        }
        isSecureTextEntry = !isSecureTextEntry
    }
    
    func returnArrayList(dropDownData:[dataArray])->Array<String>{
        var newList = [String]()
        for i in 0...dropDownData.count-1 {
            newList.append((dropDownData[i].value))
        }
        return newList
    }
    
    /*func dropDownForAgenyTypeView(){
        dropDownAgency.anchorView = agencyTypeView
        dropDownAgency.dataSource = returnArrayList(dropDownData: agencyData)
        DispatchQueue.main.async {
            self.dropDownAgency.bottomOffset = CGPoint(x: 0, y: (self.dropDownAgency.anchorView?.plainView.bounds.height)!)
        }
    }*/
    
    func dropDownSettingView(dropdownName:DropDown,dataToset:[dataArray]){
        dropdownName.anchorView = agencyTypeView
        dropdownName.dataSource = returnArrayList(dropDownData: dataToset)
        DispatchQueue.main.async {
            self.dropDownAgency.bottomOffset = CGPoint(x: 0, y: (self.dropDownAgency.anchorView?.plainView.bounds.height)!)
        }
    }
    
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension SignUpVC: signUpViewModelProtocol {
    func initialCityData(cityData: AgencyTypeModel) {
        self.cityData = cityData.data
        self.dropDownSettingView(dropdownName: dropDownCity, dataToset: self.cityData)
    }
    
    func showMessage(message: String) {
        Alert().alertOkView(viewController: self, message: message)
    }
    
    func initialAgenctData(agencyData: AgencyTypeModel) {
        self.agencyData = agencyData.data
        self.dropDownSettingView(dropdownName: dropDownAgency, dataToset: self.agencyData)
    }
    
    func showActivityIndicator() {
        //show indicator
    }
    
    func hideActivityIndicator() {
        // hide indicator
    }
}
