//
//  ViewcontrollerIndentifiers.swift
//  HomeHealthPro
//
//  Created by Ankit on 27/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

enum Controller {
    case LoginVc
    case ForgetPasswordVc
    case SignUpVC
    case DashboardViewController
}

extension Controller {
    var identifier: String {
        switch self {
        case .LoginVc: return "LoginVc"
        case .ForgetPasswordVc: return "ForgetPasswordVc"
        case .SignUpVC: return "SignUpVC"
        case .DashboardViewController: return "DashboardViewController"
        }
    }
}
