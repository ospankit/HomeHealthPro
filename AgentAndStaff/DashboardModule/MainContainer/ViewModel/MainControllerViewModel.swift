//
//  MainControllerViewModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 19/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

protocol MainControllerViewModelProtocol:class {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func logoutOutSucess()
}

class MainControllerViewModel {
    
    weak var delegate : MainControllerViewModelProtocol?
    
    func logoutInitiated() {
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .logout, isAuthRequired: true, methodType: .get, param: Optional<String>.none) {
            (response:Result<LogoutResponseModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status {
                    self.delegate?.showMessage(message: resp.message)
                    break
                }
                self.delegate?.logoutOutSucess()
            case .failure(let error):
                self.delegate?.showMessage(message: error.errorDescription)
            }
        }
    }
    
}
