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
    @IBOutlet weak var agencyTypeView: UIView!
    @IBOutlet weak var agencyTypeLabel: UILabel!
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
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfSignUpVC()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func agencyTypeAction(_ sender: Any) {
        dropDown.show()
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.agencyTypeLabel.text = item
            self.agencyTypeLabel.textColor = UIColor.colorPrimary
        }
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
        
        
        //drop down setting
        dropDown.anchorView = agencyTypeView
        dropDown.dataSource = ["A","B","C","D"]
        dropDown.bottomOffset = CGPoint(x: 0, y: (dropDown.anchorView?.plainView.bounds.height)!)
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
}

extension SignUpVC: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
