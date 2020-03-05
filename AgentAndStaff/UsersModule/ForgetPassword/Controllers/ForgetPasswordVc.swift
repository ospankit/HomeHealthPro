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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfForgetPasswordVc()
    }
    
    @IBAction func backToLoginViewAction(_ sender: UIButton) {
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func resetPasswordAction(_ sender: UIButton) {
        guard let emailAddress = forgetPasswordEmailAddressTextField.text , !emailAddress.isEmpty else {
            Alert().alertOkView(viewController:self,message:ReuseAbleIdentifier.enterEmailAddress.identifier)
            return
        }
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
