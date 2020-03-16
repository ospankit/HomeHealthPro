//
//  RemoteHelper.swift
//  HomeHealthPro
//
//  Created by Ankit on 13/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

 struct APIKey {
   static let token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1bmlxdWVfbmFtZSI6Ijg4Q0M1OUE5LTYwNEYtNDg2My1BMEYxLTVDOTI5MDc5RDJGNiIsInJvbGUiOiJBR0VOQ1kiLCJuYmYiOjE1ODQxMDQ3MzQsImV4cCI6MTU4NDE5MTEzNCwiaWF0IjoxNTg0MTA0NzM0fQ.67b_vtI_JwDQ4kqmHzK028xzCjo8cqKvYmv36_IHlVA"
}

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
            return "172.16.3.19:85/api/"
        case .test:
            return ""
        case .uat:
            return ""
        case .live:
            return ""
        }
    }
}

enum RemoteService {
    case login
    case masterList
}

extension RemoteService {
    
    var url: URL {
        switch self {
        case .login: return URL(string: environment.HTTPProtocol + environment.domain + UrlConstant.loginUrl.identifer)!
        case .masterList: return URL(string: environment.HTTPProtocol + environment.domain + UrlConstant.masterList.identifer)!
        }
    }
}

