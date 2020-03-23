//
//  OTPVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 11/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class OTPVC: UIViewController {

    @IBOutlet weak var otpTextField6: UITextField!
    @IBOutlet weak var otpTextField5: UITextField!
    @IBOutlet weak var otpTextField4: UITextField!
    @IBOutlet weak var otpTextField3: UITextField!
    @IBOutlet weak var otpTextField2: UITextField!
    @IBOutlet weak var otpTextField1: UITextField!
    
    @IBOutlet weak var resendOTPButton: UIButton!
    @IBOutlet weak var phoneVerificationLabel: UILabel!
    @IBOutlet weak var enterOTPLabel: UILabel!
    
    var viewModel = OTPViewModel()
    
    var otpData : OTPModel?
    
    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfOTPVC()
        viewModel.delegate = self
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        
        /*let vc = UIStoryboard.init(name: StoryBoard.Dashboard.indentifier, bundle: nil).instantiateViewController(identifier: Controller.MainContainerController.identifier) as! MainContainerController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()*/
        
        if (otpTextField1.checkEmpty() || otpTextField2.checkEmpty() || otpTextField3.checkEmpty() || otpTextField4.checkEmpty() || otpTextField5.checkEmpty() || otpTextField6.checkEmpty()) {
            Alert.sharedInstance.alertOkView(viewController: self, message: ReuseAbleIdentifier.enterOTP.identifier)
            return
        }
        let otp = "\(otpTextField1.text!)" + "\(otpTextField2.text!)" + "\(otpTextField3.text!)" + "\(otpTextField4.text!)" + "\(otpTextField5.text!)" + "\(otpTextField6.text!)"
        let verifyOTPRequest = OTPCheckRequest(Otp:otp,UserId: GeneralUserDefaultsManager.sharedInstance.userId)
        viewModel.checkOTP(param: verifyOTPRequest)
    }
    
    @IBAction func resendOTPButtonAction(_ sender: Any) {
        let resendOTPRequest = OTPResendRequest(UserId: GeneralUserDefaultsManager.sharedInstance.userId)
        viewModel.resendOTP(param: resendOTPRequest)
    }
    
    @IBAction func otpBackButtonAction(_ sender: Any) {
        dismiss(animated: false, completion: nil)
    }
    
}

extension OTPVC {
    func initialSettingOfOTPVC() {
        //make textfield round
        otpTextField1.makeCornerRadius(raidus: otpTextField1.frame.size.height/2)
        otpTextField2.makeCornerRadius(raidus: otpTextField1.frame.size.height/2)
        otpTextField3.makeCornerRadius(raidus: otpTextField1.frame.size.height/2)
        otpTextField4.makeCornerRadius(raidus: otpTextField1.frame.size.height/2)
        otpTextField5.makeCornerRadius(raidus: otpTextField1.frame.size.height/2)
        otpTextField6.makeCornerRadius(raidus: otpTextField1.frame.size.height/2)
        
        //color
        otpTextField1.backgroundColor = .bagroundGrey
        otpTextField2.backgroundColor = .bagroundGrey
        otpTextField3.backgroundColor = .bagroundGrey
        otpTextField4.backgroundColor = .bagroundGrey
        otpTextField5.backgroundColor = .bagroundGrey
        otpTextField6.backgroundColor = .bagroundGrey
        
        phoneVerificationLabel.textColor = .colorPrimaryDark
        enterOTPLabel.textColor = .fpGrey
        
        resendOTPButton.tintColor = .colorPrimary
        
        continueButton.addGradientToButton(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: false)
        
        //corner radius
        continueButton.makeCornerRadius(raidus: continueButton.frame.size.height/2)
    }
}

extension OTPVC : UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if (textField.text!.count < 1  && string.count > 0){
            if textField == otpTextField1{
                otpTextField2.becomeFirstResponder()
            }
            if textField == otpTextField2{
                otpTextField3.becomeFirstResponder()
            }
            if textField == otpTextField3{
                otpTextField4.becomeFirstResponder()
            }
            if textField == otpTextField4{
                otpTextField5.becomeFirstResponder()
            }
            if textField == otpTextField5{
                otpTextField6.becomeFirstResponder()
            }
            if textField == otpTextField6{
                otpTextField6.resignFirstResponder()
            }
            textField.text = string
            return false
        }
        else if (textField.text!.count >= 1  && string.count == 0){
            if textField == otpTextField1{
                otpTextField1.resignFirstResponder()
            }
            if textField == otpTextField2{
                otpTextField1.becomeFirstResponder()
            }
            if textField == otpTextField3{
                otpTextField2.becomeFirstResponder()
            }
            if textField == otpTextField4{
                otpTextField3.becomeFirstResponder()
            }
            if textField == otpTextField5{
                otpTextField4.becomeFirstResponder()
            }
            if textField == otpTextField6{
                otpTextField5.becomeFirstResponder()
            }
            textField.text = ""
            return false
        }else if (textField.text!.count >= 1) {
            textField.text = string
            return false
        }
        return true
    }
}

extension OTPVC : OTPViewModelProtocol {
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
    
    func validOTP() {
        DispatchQueue.main.async {
            let vc = UIStoryboard.init(name: StoryBoard.Dashboard.indentifier, bundle: nil).instantiateViewController(identifier: Controller.MainContainerController.identifier) as! MainContainerController
            UIApplication.shared.windows.first?.rootViewController = vc
            UIApplication.shared.windows.first?.makeKeyAndVisible()
        }
    }
    
    func sucessResendOTP(message: String) {
        DispatchQueue.main.async {
            Alert.sharedInstance.alertOkView(viewController: self, message: message)
        }
    }
    
    
}
