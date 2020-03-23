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
    @IBOutlet weak var agencyDropDownView: UIView!
    @IBOutlet weak var stateDropDownView: UIView!
    @IBOutlet weak var zipcodeDropDownView: UIView!
    @IBOutlet weak var cityDropDownView: UIView!
    @IBOutlet weak var agencyTypetextField: SkyFloatingLabelTextField!
    @IBOutlet weak var contactPersonNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var phoneLandlineNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emailAddressTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var faxNumberTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var passwordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var addressLineTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var emrNameTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var alreadyHaveAnAccountLabel: UILabel!
    @IBOutlet weak var doHaveEMRSystemlabel: UILabel!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var emrYesRadiobutton: UIButton!
    @IBOutlet weak var emrNoRadioButton: UIButton!
    @IBOutlet weak var homeHealthProElectronicYesRadioButton: UIButton!
    @IBOutlet weak var homeHealthProElectronicNoRadioButton: UIButton!
    @IBOutlet weak var iAcceptLabel: UILabel!
    var passwordHideShowButton = UIButton(type: .custom)
    var isSecureTextEntry = true
    
    @IBOutlet weak var utilizeHomeHealthProElectronicYesNoView: UIView!
    
    @IBOutlet var utilizeHomeHealthproElectronicAndIAcceptTermsDistance: NSLayoutConstraint!
    @IBOutlet var emrNameTextFieldAndIAcceptTermsDistanceConstraint: NSLayoutConstraint!
    @IBOutlet var ulitizeHomeHealthProEletronicYesNoAndEmrYesNoDistanceConstraint: NSLayoutConstraint!
    @IBOutlet var appectTermsAndYesNoEmrDistanceConstraint: NSLayoutConstraint!
    @IBOutlet var yesRadioButtonEmrTextFieldDistance: NSLayoutConstraint!
    
    var agencyId = 0
    var stateId = 0
    var cityId = 0
    var isEMRSystem : Bool?
    var IsClinicalNotes : Bool?
    var acceptterms : Bool?
    
    
    let dropDownAgency = DropDown()
    let dropDownState = DropDown()
    let dropDownCity = DropDown()
    let dropDownZipcode  = DropDown()
    
    var agencyData = [DropdownData]()
    var stateData = [DropdownData]()
    var cityData = [DropdownData]()
    var zipcodeData = [DropdownData]()
    
    var viewModel = signUpViewModel()
    
    var agencyDataModel : agencyModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfSignUpVC()
        viewModel.delegate = self
        let agencyTypeRequest = masterList(Type: "AgencyType", CityId: cityId, StateId: stateId)
        viewModel.getDropdownListData(for: .agency, param: agencyTypeRequest)
        let stateRequest = masterList(Type: "State", CityId: cityId, StateId: stateId)
        viewModel.getDropdownListData(for: .state, param: stateRequest)
    }
    
    @IBAction func agencyTypeAction(_ sender: Any) {
        dropDownAgency.show()
        dropDownAgency.selectionAction = { [unowned self] (index: Int, item: String) in
            self.agencyTypetextField.text = item
            self.agencyTypetextField.selectedLineColor = UIColor.colorPrimary
            self.agencyTypetextField.selectedTitleColor = UIColor.colorPrimary
            self.agencyTypetextField.textColor = UIColor.colorPrimaryDark
            self.agencyTypetextField.tintColor = UIColor.colorPrimary
            self.agencyId = Int(self.agencyData[index].id)
        }
    }
    @IBAction func stateTypeAction(_ sender: Any) {
        dropDownState.show()
        dropDownState.selectionAction = { [unowned self] (index: Int, item: String) in
            self.stateNameTextField.text = item
            self.stateNameTextField.selectedLineColor = UIColor.colorPrimary
            self.stateNameTextField.selectedTitleColor = UIColor.colorPrimary
            self.stateNameTextField.textColor = UIColor.colorPrimaryDark
            self.stateNameTextField.tintColor = UIColor.colorPrimary
            self.stateId = Int(self.stateData[index].id)
            let cityRequest = masterList(Type: "City", CityId: self.cityId, StateId: self.stateId)
            self.viewModel.getDropdownListData(for: .city, param: cityRequest)
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
            self.cityId = Int(self.cityData[index].id)
            let zipcodeRequest = masterList(Type: "ZipCode", CityId: self.cityId, StateId: self.stateId)
            self.viewModel.getDropdownListData(for: .zipCode, param: zipcodeRequest)
        }
    }
    
    @IBAction func zipcodeTypeAction(_ sender: Any) {
        dropDownZipcode.show()
        dropDownZipcode.selectionAction = { [unowned self] (index: Int, item: String) in
            self.zipcodeNameTextField.text = item
            self.zipcodeNameTextField.selectedLineColor = UIColor.colorPrimary
            self.zipcodeNameTextField.selectedTitleColor = UIColor.colorPrimary
            self.zipcodeNameTextField.textColor = UIColor.colorPrimaryDark
            self.zipcodeNameTextField.tintColor = UIColor.colorPrimary
        }
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func emrYesRadioButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(named: "RadioUnselected"), for: .normal)
            emrNoRadioButton.setImage(UIImage(named: "RadioSelected"), for: .normal)
            emrNoRadioButton.isSelected = true
            showUtilizeHomeHealthProElectronicYesNoView()
        }else {
            sender.setImage(UIImage(named: "RadioSelected"), for: .normal)
            emrNoRadioButton.setImage(UIImage(named: "RadioUnselected"), for: .normal)
            emrNoRadioButton.isSelected = false
            isEMRSystem = true
            showEMRTextField()
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func emrNoRadioButtonSelected(_ sender: UIButton) {
       if sender.isSelected {
            sender.setImage(UIImage(named: "RadioUnselected"), for: .normal)
            emrYesRadiobutton.setImage(UIImage(named: "RadioSelected"), for: .normal)
            emrYesRadiobutton.isSelected = true
            showEMRTextField()
        }else {
            sender.setImage(UIImage(named: "RadioSelected"), for: .normal)
            emrYesRadiobutton.setImage(UIImage(named: "RadioUnselected"), for: .normal)
            emrYesRadiobutton.isSelected = false
            isEMRSystem = false
            showUtilizeHomeHealthProElectronicYesNoView()
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func homeHealthProElectronicYesRadioButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(named: "RadioUnselected"), for: .normal)
            homeHealthProElectronicNoRadioButton.setImage(UIImage(named: "RadioSelected"), for: .normal)
            homeHealthProElectronicNoRadioButton.isSelected = true
        }else {
            sender.setImage(UIImage(named: "RadioSelected"), for: .normal)
            homeHealthProElectronicNoRadioButton.setImage(UIImage(named: "RadioUnselected"), for: .normal)
            homeHealthProElectronicNoRadioButton.isSelected = false
            IsClinicalNotes = true
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func homeHealthProElectronicNoRadioButtonSelected(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(named: "RadioUnselected"), for: .normal)
            homeHealthProElectronicYesRadioButton.setImage(UIImage(named: "RadioSelected"), for: .normal)
            homeHealthProElectronicYesRadioButton.isSelected = true
        }else {
            sender.setImage(UIImage(named: "RadioSelected"), for: .normal)
            homeHealthProElectronicYesRadioButton.setImage(UIImage(named: "RadioUnselected"), for: .normal)
            homeHealthProElectronicYesRadioButton.isSelected = false
            IsClinicalNotes = false
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func termsAndConditionCheckBox(_ sender: UIButton) {
        if sender.isSelected {
            sender.setImage(UIImage(named: "Uncheck"), for: .normal)
            acceptterms = false
        }else {
            sender.setImage(UIImage(named: "Check"), for: .normal)
            acceptterms = true
        }
        sender.isSelected = !sender.isSelected
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        if agencyNameTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.agencyName.identifier)
        }else if agencyNameTextField.validText() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.validAgencyName.identifier)
        }else if agencyTypetextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.agencyType.identifier)
        }else if contactPersonNameTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.contactPerson.identifier)
        }else if contactPersonNameTextField.validText() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.validConatctPersonName.identifier)
        }else if phoneLandlineNumberTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.phoneNumber.identifier)
        }else if phoneLandlineNumberTextField.phoneNumberValidate() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.validPhoneNumber.identifier)
        }else if emailAddressTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.emailAddress.identifier)
        }else if emailAddressTextField.validEmail() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.validemail.identifier)
        }else if faxNumberTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.faxNumber.identifier)
        }else if faxNumberTextField.phoneNumberValidate() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.validFaxNumber.identifier)
        }else if passwordTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.enterPassword.identifier)
        }else if passwordTextField.validPassword() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.validPassword.identifier)
        }else if addressLineTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.addressLine.identifier)
        }else if stateNameTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.state.identifier)
        }else if cityNameTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.city.identifier)
        }else if zipcodeNameTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.zipcode.identifier)
        }else if isEMRSystem == nil{
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.emrSystemSeletion.identifier)
        }
        
        if isEMRSystem == true {
            if emrNameTextField.checkEmpty() {
                Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.emrSystemName.identifier)
            }
        }else {
            if IsClinicalNotes == nil {
                Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.clinianNotes.identifier)
            }
        }
        
        if acceptterms == false {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.termsAndCondition.identifier)
        }
        
        let signUpRequest = SignUpRequest(AgencyName: agencyNameTextField.text!, ContactPersonName: contactPersonNameTextField.text!, Email: emailAddressTextField.text!, ContactNo: contactPersonNameTextField.text!, Fax: faxNumberTextField.text!, AddressLine: addressLineTextField.text!, ZipCode: zipcodeNameTextField.text!, Password: passwordTextField.text!, EMRSystemName: emrNameTextField.text!, AgencyTypeId: agencyId, CityId: cityId, StateId: stateId, IsEMRSystem: isEMRSystem!, IsClinicalNotes: IsClinicalNotes!)
        
        
    }
    
    
    
}

extension SignUpVC {
    //setting view backGroundColor
    func initialSettingOfSignUpVC() {
        //initial constraint setting
        appectTermsAndYesNoEmrDistanceConstraint.constant = 20
        yesRadioButtonEmrTextFieldDistance.isActive = false
        ulitizeHomeHealthProEletronicYesNoAndEmrYesNoDistanceConstraint.isActive = false
        emrNameTextFieldAndIAcceptTermsDistanceConstraint.isActive = false
        utilizeHomeHealthproElectronicAndIAcceptTermsDistance.isActive = false
        
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
    
    func dropDownDataSet(dropDown:DropDown,dropDownView:UIView,dropDownData:[DropdownData]){
        dropDown.anchorView = dropDownView
        dropDown.dataSource = dropDownData.compactMap({$0.value})
        DispatchQueue.main.async {
            dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
        }
    }
    
    func showEMRTextField(){
        DispatchQueue.main.async {
            self.appectTermsAndYesNoEmrDistanceConstraint.isActive = false
            self.yesRadioButtonEmrTextFieldDistance.isActive = true
            self.emrNameTextFieldAndIAcceptTermsDistanceConstraint.isActive = true
            self.ulitizeHomeHealthProEletronicYesNoAndEmrYesNoDistanceConstraint.isActive = false
            self.utilizeHomeHealthproElectronicAndIAcceptTermsDistance.isActive = false
            self.yesRadioButtonEmrTextFieldDistance.constant = 4
            self.emrNameTextFieldAndIAcceptTermsDistanceConstraint.constant = 20
            self.emrNameTextField.isHidden = false
            self.utilizeHomeHealthProElectronicYesNoView.isHidden = true
        }
    }
    
    func showUtilizeHomeHealthProElectronicYesNoView(){
        DispatchQueue.main.async {
            self.appectTermsAndYesNoEmrDistanceConstraint.isActive = false
            self.yesRadioButtonEmrTextFieldDistance.isActive = false
            self.emrNameTextFieldAndIAcceptTermsDistanceConstraint.isActive = false
            self.ulitizeHomeHealthProEletronicYesNoAndEmrYesNoDistanceConstraint.isActive = true
            self.utilizeHomeHealthproElectronicAndIAcceptTermsDistance.isActive = true
            self.ulitizeHomeHealthProEletronicYesNoAndEmrYesNoDistanceConstraint.constant = 20
            self.utilizeHomeHealthproElectronicAndIAcceptTermsDistance.constant = 20
            self.utilizeHomeHealthProElectronicYesNoView.isHidden = false
            self.emrNameTextField.isHidden = true
        }
    }
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField == phoneLandlineNumberTextField) || (textField == faxNumberTextField)  {
            if textField.text?.count == 12 {
                textField.text?.removeLast()
            }
            if textField.text!.count > 1 {
                if let formattedNumber = textField.text?.formattedNumber() {
                    textField.text = formattedNumber
                }
            }
        }
        return true
    }
}

extension SignUpVC: signUpViewModelProtocol {
    func createdAgency(agencyDataModel: agencyModel) {
        self.agencyDataModel = agencyDataModel
        DispatchQueue.main.async {
            self.dismiss(animated: false, completion: nil)
        }
    }
    
    func zipcodeData(zipcodeData: DropdownDataTypeModel) {
        self.zipcodeData = zipcodeData.data
        dropDownDataSet(dropDown: dropDownZipcode, dropDownView: zipcodeDropDownView, dropDownData: self.zipcodeData)
    }
    
    func cityData(cityData: DropdownDataTypeModel) {
        self.cityData = cityData.data
        dropDownDataSet(dropDown: dropDownCity, dropDownView: cityDropDownView, dropDownData: self.cityData)
    }
    
    func initialStateData(stateData: DropdownDataTypeModel) {
        self.stateData = stateData.data
        dropDownDataSet(dropDown: dropDownState, dropDownView: stateDropDownView, dropDownData: self.stateData)
    }
    
    func showMessage(message: String) {
        DispatchQueue.main.async {
            Alert.sharedInstance.alertOkView(viewController: self, message: message)
        }
    }
    
    func initialAgenctData(agencyData: DropdownDataTypeModel) {
        self.agencyData = agencyData.data
        dropDownDataSet(dropDown: dropDownAgency, dropDownView: agencyDropDownView, dropDownData: self.agencyData)
    }
    
    func showActivityIndicator() {
        DispatchQueue.main.async {
            ActivityIndicator.shared.showIndicator(view: self)
        }
    }
    
    func hideActivityIndicator() {
        DispatchQueue.main.async {
            ActivityIndicator.shared.hideActivity()
        }
    }
}
