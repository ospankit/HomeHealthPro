//
//  signUpViewModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 16/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

protocol signUpViewModelProtocol {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func initialAgenctData(agencyData:AgencyTypeModel)
    func initialCityData(cityData:AgencyTypeModel)
}

class signUpViewModel{
    
    var delegate:signUpViewModelProtocol?
    private(set) var agencyData:AgencyTypeModel?
    
    func getInitialAgencyData(param:masterList) {
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .masterList, isAuthRequired: false, methodType: .post, param: param) { (response:Result<AgencyTypeModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status{
                   self.delegate?.showMessage(message: ResponseError.unKnownError.errorDescription ?? "unknown error")
                }
                self.agencyData = resp
                if param.Type == "AgencyType"{
                    self.delegate?.initialAgenctData(agencyData: resp)
                }else if param.Type == "City" {
                    self.delegate?.initialAgenctData(agencyData: resp)
                }
                
            case .failure(let error):
                self.delegate?.showMessage(message: error.localizedDescription)
            }
        }
    }
}

