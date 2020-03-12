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
    
    @IBOutlet weak var continueButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSettingOfOTPVC()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func continueButtonAction(_ sender: Any) {
        let vc = UIStoryboard.init(name: StoryBoard.Dashboard.indentifier, bundle: nil).instantiateViewController(identifier: Controller.MainContainerController.identifier) as! MainContainerController
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
    
    @IBAction func resendOTPButtonAction(_ sender: Any) {
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
