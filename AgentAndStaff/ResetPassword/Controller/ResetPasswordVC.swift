//
//  ResetPasswordVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 18/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class ResetPasswordVC: UIViewController {

    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var newPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var resetSaveAndUpdateButton: UIButton!
    @IBOutlet weak var resetPasswordBackGroubdView: UIView!
    
    var newPasswordHideShowButton = UIButton(type: .custom)
    var confirmPasswordHideShowButton = UIButton(type: .custom)
    
    var isSecureTextEntry = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetting()
        // Do any additional setup after loading the view.
    }
}

extension ResetPasswordVC {
    func initialSetting() {
        // background color
        resetPasswordBackGroubdView.backgroundColor = .bagroundGrey
        
        //adding button to textfield
        newPasswordHideShowButton.addTarget(self, action: #selector(hideShowPassword), for: .touchUpInside)
        newPasswordHideShowButton.frame(forAlignmentRect: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(30), height: newPasswordTextField.bounds.height))
        newPasswordHideShowButton.setBackgroundImage(UIImage(named: Constant.Invisible.identifier), for: .normal)
        newPasswordTextField.rightViewMode = .always
        newPasswordTextField.rightView = newPasswordHideShowButton
        
        confirmPasswordHideShowButton.addTarget(self, action: #selector(hideShowPassword), for: .touchUpInside)
        confirmPasswordHideShowButton.frame(forAlignmentRect: CGRect(x: CGFloat(0), y: CGFloat(0), width: CGFloat(30), height: newPasswordTextField.bounds.height))
        confirmPasswordHideShowButton.setBackgroundImage(UIImage(named: Constant.Invisible.identifier), for: .normal)
        confirmPasswordTextField.rightViewMode = .always
        confirmPasswordTextField.rightView = confirmPasswordHideShowButton
        
        //hiding data of passordTextfield
        newPasswordTextField.isSecureTextEntry = true
    }
    
    @objc func hideShowPassword() {
        if isSecureTextEntry {
            newPasswordTextField.isSecureTextEntry = false
            newPasswordHideShowButton.setBackgroundImage(UIImage(named: Constant.Visible.identifier), for: .normal)
        }else {
            newPasswordTextField.isSecureTextEntry = true
            newPasswordHideShowButton.setBackgroundImage(UIImage(named: Constant.Invisible.identifier), for: .normal)
        }
        isSecureTextEntry = !isSecureTextEntry
    }
}


