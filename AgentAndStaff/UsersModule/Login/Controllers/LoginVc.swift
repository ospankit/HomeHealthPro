//
//  LoginVc.swift
//  HomeHealthPro
//
//  Created by Ankit on 26/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

//bJKLV3J2AWDJch-Lz_Y8

import UIKit

class LoginVc: UIViewController {

    @IBOutlet var loginMainView: UIView!
    @IBOutlet weak var loginView: UIView!
    @IBOutlet weak var loginTextlabel: UILabel!
    @IBOutlet weak var loginUserNameTextField: UITextField!
    @IBOutlet weak var loginSignInButton: UIButton!
    @IBOutlet weak var loginPasswordTextField: UITextField!
    @IBOutlet weak var LoginForgetPasswordButton: UIButton!
    @IBOutlet weak var loginAlreadyAccountLabel: UILabel!
    @IBOutlet weak var loginSignUpButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfLoginVc()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func forgetPasswordAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: Controller.ForgetPasswordVc.identifier) as! ForgetPasswordVc
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(identifier: Controller.SignUpVC.identifier) as! SignUpVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
    
    @IBAction func signInAction(_ sender: UIButton) {
        guard let username = loginUserNameTextField.text , !username.isEmpty else {
            Alert().alertOkView(viewController:self,message:ReuseAbleIdentifier.enterUsername.identifier)
            return
        }
        guard let password = loginPasswordTextField.text , !password.isEmpty else {
            Alert().alertOkView(viewController:self,message:ReuseAbleIdentifier.enterPassword.identifier)
            return
        }
        /*let vc = UIStoryboard.init(name: StoryBoard.Dashboard.indentifier, bundle: nil).instantiateViewController(identifier: Controller.MainContainerController.identifier) as! MainContainerController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()*/
        let vc = storyboard?.instantiateViewController(identifier: Controller.OTPVC.identifier) as! OTPVC
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: false, completion: nil)
    }
}

extension LoginVc {
    func initialSettingOfLoginVc() {
        //corner radius
        let cornerRadiusCalculation = loginPasswordTextField.frame.height/2
        loginPasswordTextField.makeCornerRadius(raidus: cornerRadiusCalculation)
        loginUserNameTextField.makeCornerRadius(raidus: cornerRadiusCalculation)
        loginSignInButton.makeCornerRadius(raidus: cornerRadiusCalculation)
        
        //setting base color
        loginTextlabel.textColor = UIColor.colorPrimaryDark
        loginAlreadyAccountLabel.textColor = UIColor.colorPrimaryDark
        loginSignUpButton.tintColor = UIColor.colorPrimaryDark
        LoginForgetPasswordButton.tintColor = UIColor.colorPrimaryDark
        
        //padding for textfield
        loginUserNameTextField.leftPadding(paddingSize:20)
        loginPasswordTextField.leftPadding(paddingSize:20)
        
        //addinggraidentColor to button
        //loginSignInButton.addGradientTo(startColor:UIColor.startGradientColor,endColor:UIColor.endGradientColor,isVertical:false)
        loginSignInButton.addGradientToButton(startColor:UIColor.startGradientColor,endColor:UIColor.endGradientColor,isVertical:false)
        
        //setting backGroundcolor
        loginView.backgroundColor = UIColor.bagroundGrey
        loginMainView.backgroundColor = UIColor.bagroundGrey
        
        //setting tint color
        loginUserNameTextField.tintColor = UIColor.colorPrimary
        loginPasswordTextField.tintColor = UIColor.colorPrimary
    }
}

extension LoginVc: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
