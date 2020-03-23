//
//  LoginViewModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 13/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

protocol LoginViewModelProtocol:class {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func loginSucess()
}

class LoginViewModel {
    
    weak var delegate : LoginViewModelProtocol?
    private(set) var loginResponse:LoginModel?
    
    func checkLoginDetails(param:LoginRequest) {
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .login, isAuthRequired: true, methodType: .post, param: param) { (response:Result<LoginModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status{
                    self.delegate?.showMessage(message: ResponseError.unKnownError.errorDescription ?? "unknown error")
                    break
                }
                self.loginResponse = resp
                self.delegate?.loginSucess()
            case .failure(let error):
                self.delegate?.showMessage(message: error.errorDescription)
            }
        }
    }
    
}
