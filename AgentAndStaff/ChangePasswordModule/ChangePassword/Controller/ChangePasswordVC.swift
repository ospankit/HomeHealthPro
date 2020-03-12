//
//  ChangePasswordVC.swift
//  HomeHealthPro
//
//  Created by Ankit on 11/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class ChangePasswordVC: UIViewController {

    @IBOutlet weak var changePasswordLabel: UILabel!
    @IBOutlet weak var oldPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var newPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var confirmPasswordTextField: SkyFloatingLabelTextField!
    @IBOutlet weak var saveUpdateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfChangePasswordVC()
        // Do any additional setup after loading the view.
    }

    @IBAction func changePasswordBackButtonAction(_ sender: Any) {
    }
}

extension ChangePasswordVC{
    func initialSettingOfChangePasswordVC() {
        
        //textfield setting
        
        //cornerRadius
        saveUpdateButton.makeCornerRadius(raidus: saveUpdateButton.frame.size.height/2)
        
        //graident
        saveUpdateButton.addGradientToButton(startColor: .startGradientColor, endColor: .endGradientColor, isVertical: false)
        
        //textfield
        oldPasswordTextField.lineColor = .bagroundGrey
        newPasswordTextField.lineColor = .bagroundGrey
        confirmPasswordTextField.lineColor = .bagroundGrey
        oldPasswordTextField.selectedTitleColor = .black
        newPasswordTextField.lineColor = .bagroundGrey
        confirmPasswordTextField.lineColor = .bagroundGrey
        oldPasswordTextField.selectedLineColor = .bagroundGrey
        newPasswordTextField.selectedLineColor = .bagroundGrey
        confirmPasswordTextField.selectedLineColor = .bagroundGrey
        
        
    }
}
