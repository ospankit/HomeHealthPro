//
//  CliniciansViewModel.swift
//  HomeHealthPro
//
//  Created by ankit shelar on 20/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

protocol CliniciansViewModelProtocol:class {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func responseCliniciansData()
}

class CliniciansViewModel {
    
    weak var delegate : CliniciansViewModelProtocol?
    
    var cliniciansResponseData : CilniciansModel?
    
    var cliniciansData = [ClinicianData]()
    
    func getInitialClinicianData(param:ClinicianListRequest){
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .clinicianList, isAuthRequired: true, methodType: .post, param: param) { (response:Result<CilniciansModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status{
                    self.delegate?.showMessage(message: resp.message)
                    break
                }
                self.cliniciansResponseData = resp
                self.cliniciansData.append(contentsOf: resp.data)
                self.delegate?.responseCliniciansData()
            case .failure(let error):
                self.delegate?.showMessage(message: error.errorDescription)
            }
        }
    }
    
}
