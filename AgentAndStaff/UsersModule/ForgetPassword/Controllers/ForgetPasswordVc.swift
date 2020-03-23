//
//  ForgetPasswordVc.swift
//  HomeHealthPro
//
//  Created by Ankit on 27/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class ForgetPasswordVc: UIViewController {

    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var enterYourEmaillLabel: UILabel!
    @IBOutlet weak var forgetPasswordEmailAddressTextField: UITextField!
    @IBOutlet weak var forgetPasswordResetPasswordButton: UIButton!
    @IBOutlet weak var forgetPasswordClickToGoToLoginScreen: UIButton!
    
    var viewModel = ForgetPasswordViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfForgetPasswordVc()
        viewModel.delegate = self
    }
    
    @IBAction func backToLoginViewAction(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func resetPasswordAction(_ sender: UIButton) {
        if forgetPasswordEmailAddressTextField.checkEmpty() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.emailAddress.identifier)
        }else if forgetPasswordEmailAddressTextField.validEmail() {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.validemail.identifier)
        }
        
        let forgetPasswordRequest = ForgetPasswordRequest(Email: forgetPasswordEmailAddressTextField.text!)
        viewModel.forgetPassword(param: forgetPasswordRequest)
    }
    
    
}

extension ForgetPasswordVc {
    func initialSettingOfForgetPasswordVc() {
        //adding corner radius
        let cornerRadiusCalculation = forgetPasswordEmailAddressTextField.frame.height/2
        forgetPasswordEmailAddressTextField.makeCornerRadius(raidus: cornerRadiusCalculation)
        forgetPasswordResetPasswordButton.makeCornerRadius(raidus: cornerRadiusCalculation)
        
        //adding color to label
        forgetPasswordLabel.textColor = UIColor.colorPrimaryDark
        forgetPasswordClickToGoToLoginScreen.tintColor = UIColor.colorPrimaryDark
        enterYourEmaillLabel.textColor = UIColor.fpGrey
        
        //addinggraidentColor to button
        forgetPasswordResetPasswordButton.addGradientTo(startColor: UIColor.startGradientColor, endColor: UIColor.endGradientColor, isVertical: false)
        
        //adding border
        forgetPasswordEmailAddressTextField.addBorder(width: 1)
        
        //adding padding
        forgetPasswordEmailAddressTextField.leftPadding(paddingSize: 20)
        
        //adding tintColor
        forgetPasswordEmailAddressTextField.tintColor = UIColor.colorPrimary
    }
}

extension ForgetPasswordVc: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

extension ForgetPasswordVc: ForgetPasswordViewModelProtocol {
    func forgetPasswordLinkSent(forgetPasswordResponse: ForgetPasswordModel) {
        DispatchQueue.main.async {
            Alert.sharedInstance.alertOkView(viewController: self, message: forgetPasswordResponse.message)
        }
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
    
    func showMessage(message: String) {
        DispatchQueue.main.async {
            Alert.sharedInstance.alertOkView(viewController: self, message: message)
        }
    }
    
    
    
    
}
