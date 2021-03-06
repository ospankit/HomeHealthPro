//
//  RemoteHelper.swift
//  HomeHealthPro
//
//  Created by Ankit on 13/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

fileprivate let environment = Environment.dev

enum ResponseError {
    case noData
    case wrongData
    case JSONSerializationFailed
    case noMatchigResults
    case notFound
    case internalServerError
    case unauthorizedError
    case unKnownError
    
    var errorDescription: String? {
        switch self {
        case .noData:
            return "There is no data available. Please contact support team."// no data available on service fetch
        case .wrongData:
            return "Something went wrong, Please try again later!!!" // We can change this message to any custom and valid error message to user
        case .JSONSerializationFailed:
            return "JSONSerialization Failed, Please check the json data"
        case .noMatchigResults:
            return "No matching results found"
        case .notFound:
            return "Not Found"
        case .internalServerError:
            return "Internal Server Error"
        case .unauthorizedError:
            return "Unauthorized error"
        case .unKnownError:
            return "Unknown Error "
        }
    }
}

enum Environment {
    case dev
    case test
    case uat
    case live
}

extension Environment {
    
    
    var HTTPProtocol: String {
        switch self {
        case .dev:
            return "http://"
        case .test:
            return "http://"
        case .uat:
            return "http://"
        case .live:
            return "http://"
        }
    }
    
    var domain: String {
        switch self {
        case .dev:
            //return "172.16.3.19:85/api/"
            return "27.106.74.218:8002"
        case .test:
            return ""
        case .uat:
            return ""
        case .live:
            return ""
        }
    }
    
    var folder: String {
        switch self {
        case .dev:
            return "/api/"
        case .test:
            return "/api/"
        case .uat:
            return "/api/"
        case .live:
            return "/api/"
        }
    }
}

enum BaseUrl{
    case baseUrl
}

extension BaseUrl{
    var baseUrlString:String {
        switch self {
        case .baseUrl:
            return environment.HTTPProtocol + environment.domain
        }
    }
}

enum RemoteService {
    case login
    case masterList
    case agencyAdd
    case forgetPassword
    case verifyOTP
    case resendOTP
    case agencyDashboard
    case logout
    case clinicianList
    case patientList
}

extension RemoteService {
    
    var url: URL {
        switch self {
        case .login: return URL(string: environment.HTTPProtocol + environment.domain + environment.folder + UrlConstant.loginUrl.identifer)!
        case .masterList: return URL(string: environment.HTTPProtocol + environment.domain + environment.folder +  UrlConstant.masterList.identifer)!
        case .agencyAdd: return URL(string: environment.HTTPProtocol + environment.domain + environment.folder + UrlConstant.agencyAdd.identifer)!
        case .forgetPassword: return URL(string: environment.HTTPProtocol + environment.domain + environment.folder + UrlConstant.forgetPassword.identifer)!
        case .resendOTP : return URL(string: environment.HTTPProtocol + environment.domain + environment.folder + UrlConstant.resendOTP.identifer)!
        case .verifyOTP : return URL(string: environment.HTTPProtocol + environment.domain + environment.folder + UrlConstant.verifyOTP.identifer)!
        case .agencyDashboard: return URL(string: environment.HTTPProtocol + environment.domain  + environment.folder + UrlConstant.agencyDashboard.identifer)!
        case .logout: return URL(string: environment.HTTPProtocol + environment.domain + environment.folder + UrlConstant.logout.identifer)!
        case .clinicianList: return URL(string: environment.HTTPProtocol + environment.domain + environment.folder + UrlConstant.clinicianList.identifer)!
        case .patientList: return URL(string: environment.HTTPProtocol + environment.domain + environment.folder + UrlConstant.patientList.identifer)!

        }
    }
}

