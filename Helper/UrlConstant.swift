//
//  UrlConstant.swift
//  HomeHealthPro
//
//  Created by Ankit on 13/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

enum UrlConstant {
    case loginUrl
    case masterList
    case agencyAdd
    case forgetPassword
}

extension UrlConstant {
    var identifer : String {
        switch self {
        case .loginUrl: return "auth/token"
        case .masterList: return "masterlist"
        case .agencyAdd: return "agency/add"
        case .forgetPassword: return "user/password/forgot"
        }
    }
}
