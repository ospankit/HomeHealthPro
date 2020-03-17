//
//  signUpViewModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 16/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

enum RequestType {
    case agency
    case state
    case city
    case zipCode
}

protocol signUpViewModelProtocol {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func initialAgenctData(agencyData:DropdownDataTypeModel)
    func initialStateData(stateData:DropdownDataTypeModel)
    func cityData(cityData:DropdownDataTypeModel)
    func zipcodeData(zipcodeData:DropdownDataTypeModel)
}

class signUpViewModel{
    
    var delegate:signUpViewModelProtocol?
    private(set) var agencyData:DropdownDataTypeModel?
    private(set) var stateData:DropdownDataTypeModel?
    private(set) var cityData:DropdownDataTypeModel?
    private(set) var zipcodeData:DropdownDataTypeModel?
    
    func getDropdownListData(for type: RequestType, param:masterList) {
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .masterList, isAuthRequired: false, methodType: .post, param: param) { (response:Result<DropdownDataTypeModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status{
                   self.delegate?.showMessage(message: ResponseError.unKnownError.errorDescription ?? "unknown error")
                }
                switch type {
                case .agency: self.agencyData = resp
                              self.delegate?.initialAgenctData(agencyData: resp)
                    
                case .city: self.cityData = resp
                            self.delegate?.cityData(cityData: resp)
                    
                case .state: self.stateData = resp
                            self.delegate?.initialStateData(stateData: resp)
                    
                case .zipCode: self.zipcodeData = resp
                            self.delegate?.zipcodeData(zipcodeData: resp)
                }
            case .failure(let error):
                self.delegate?.showMessage(message: error.localizedDescription)
            }
        }
    }
    
//    func getInitialstateData(param:masterList) {
//        delegate?.showActivityIndicator()
//        ApiManager.shared.fetchData(endpoints: .masterList, isAuthRequired: false, methodType: .post, param: param) { (response:Result<AgencyTypeModel,ApiError>) in
//            self.delegate?.hideActivityIndicator()
//            switch response {
//            case .success(let resp):
//                if !resp.status{
//                   self.delegate?.showMessage(message: ResponseError.unKnownError.errorDescription ?? "unknown error")
//                }
//
//            case .failure(let error):
//                self.delegate?.showMessage(message: error.localizedDescription)
//            }
//        }
//    }
//
//    func getCityData(param:masterList){
//        delegate?.showActivityIndicator()
//        ApiManager.shared.fetchData(endpoints: .masterList, isAuthRequired: false, methodType: .post, param: param) { (response:Result<AgencyTypeModel,ApiError>) in
//            self.delegate?.hideActivityIndicator()
//            switch response {
//            case .success(let resp):
//                if !resp.status{
//                    self.delegate?.showMessage(message: ResponseError.unKnownError.errorDescription ?? "unknown error")
//                }
//
//            case .failure(let error):
//                self.delegate?.showMessage(message: error.localizedDescription)
//            }
//        }
//    }
    
    //func getZipCodeData()
    
}

