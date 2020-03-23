//
//  AssignedPatientsViewModel.swift
//  HomeHealthPro
//
//  Created by ankit shelar on 22/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

protocol AssignedPatientsViewModelProtocol:class {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func patientDetailsSucess()
}

class AssignedPatientsViewModel  {
    
    weak var delegate : AssignedPatientsViewModelProtocol?
    
    var patientResponseData : AssignedPatientsModel?
    
    func getPatinetData() {
        self.delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .patientList, isAuthRequired: true, methodType: .post, param: Optional<String>.none) { (response:Result<AssignedPatientsModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status {
                    self.delegate?.showMessage(message: resp.message)
                    break
                }
                self.patientResponseData = resp
                self.delegate?.patientDetailsSucess()
            case .failure(let error):
                self.delegate?.showMessage(message: error.errorDescription)
            }
        }
    }
    
}
