//
//  OTPViewModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 19/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

protocol  OTPViewModelProtocol:class {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func validOTP()
    func sucessResendOTP(message:String)
}

class OTPViewModel {
    
    weak var delegate : OTPViewModelProtocol?
    private(set) var verifyOTPResponse:OTPModel?
    
    func checkOTP(param:OTPCheckRequest){
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .verifyOTP, isAuthRequired: false, methodType: .post, param: param) { (response:Result<OTPModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status {
                    self.delegate?.showMessage(message: resp.message)
                    break
                }
                self.verifyOTPResponse = resp
                GeneralUserDefaultsManager.sharedInstance.token = self.verifyOTPResponse?.token ?? ""
                GeneralUserDefaultsManager.sharedInstance.profileId = self.verifyOTPResponse?.user.profileId ?? ""
                GeneralUserDefaultsManager.sharedInstance.userId = self.verifyOTPResponse?.user.userId ?? ""
                GeneralUserDefaultsManager.sharedInstance.firstName = self.verifyOTPResponse?.user.firstName ?? ""
                GeneralUserDefaultsManager.sharedInstance.lastName = self.verifyOTPResponse?.user.lastName ?? ""
                GeneralUserDefaultsManager.sharedInstance.gender = self.verifyOTPResponse?.user.gender ?? ""
                GeneralUserDefaultsManager.sharedInstance.email = self.verifyOTPResponse?.user.email ?? ""
                GeneralUserDefaultsManager.sharedInstance.role = self.verifyOTPResponse?.user.role ?? ""
                GeneralUserDefaultsManager.sharedInstance.profileImage = self.verifyOTPResponse?.user.profileImage ??  ""
                self.delegate?.validOTP()
            case .failure(let error):
                self.delegate?.showMessage(message: error.errorDescription)
            }
        }
    }
    
    func resendOTP(param:OTPResendRequest) {
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .resendOTP, isAuthRequired: false, methodType: .post, param: param) { (response:Result<OTPResendedModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status {
                    self.delegate?.showMessage(message: resp.message)
                    break
                }
                self.delegate?.sucessResendOTP(message: resp.message)
            case .failure(let error):
                self.delegate?.showMessage(message: error.errorDescription)
            }
        }
    }
    
    
}
