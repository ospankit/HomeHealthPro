//
//  ForgetPasswordViewModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 18/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

protocol ForgetPasswordViewModelProtocol {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func forgetPasswordLinkSent(forgetPasswordResponse : ForgetPasswordModel)
}

class ForgetPasswordViewModel {
    var delegate:ForgetPasswordViewModelProtocol?
    private(set) var forgetPasswordResponse : ForgetPasswordModel?
    
    func forgetPassword(param:ForgetPasswordRequest){
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .forgetPassword, isAuthRequired: false, methodType: .post, param: param) { (response:Result<ForgetPasswordModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status {
                    self.delegate?.showMessage(message: resp.message)
                    break
                }
                self.forgetPasswordResponse = resp
                self.delegate?.forgetPasswordLinkSent(forgetPasswordResponse: resp)
            case .failure(let error):
                self.delegate?.showMessage(message: error.errorDescription)
            }
        }
    }
    
}
