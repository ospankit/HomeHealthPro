//
//  DashboardViewModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 19/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

protocol DashboardViewModelProtocol:class {
    func showActivityIndicator()
    func hideActivityIndicator()
    func showMessage(message:String)
    func dashboardDataSucess()
}

class DashboardViewModel {
    
    weak var delegate : DashboardViewModelProtocol?
    private(set) var dashboardResponse : DashboardModel?
    
    func getDashBoardData(param:AgencyDashboardRequest) {
        delegate?.showActivityIndicator()
        ApiManager.shared.fetchData(endpoints: .agencyDashboard, isAuthRequired: true, methodType: .post, param: param) { (response:Result<DashboardModel,ApiError>) in
            self.delegate?.hideActivityIndicator()
            switch response {
            case .success(let resp):
                if !resp.status {
                    self.delegate?.showMessage(message: resp.message)
                    break
                }
                self.dashboardResponse = resp
                self.delegate?.dashboardDataSucess()
            case .failure(let error):
                self.delegate?.showMessage(message: error.errorDescription)
            }
        }
    }
    
}
