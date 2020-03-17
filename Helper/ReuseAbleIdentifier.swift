//
//  ReuseAbleIdentifier.swift
//  HomeHealthPro
//
//  Created by Ankit on 28/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

enum ReuseAbleIdentifier {
    case AppNameIdentifier
    case enterEmailAddress
    case enterPassword
    case enterUsername
    case OK
    case agencyName
    case agencyType
    case contactPerson
    case phoneNumber
    case emailAddress
    case faxNumber
    case addressLine
    case state
    case city
    case zipcode
    case validemail
    case validAgencyName
    case validConatctPersonName
}

extension ReuseAbleIdentifier {
    var identifier : String {
        switch self {
        case .AppNameIdentifier: return "HomeHealthPro"
        case .enterEmailAddress: return "Please enter Email Address."
        case .enterPassword: return "Please enter Password."
        case .enterUsername: return "Please enter Username."
        case .OK: return "OK"
        case .agencyName: return "Please enter Agency Name."
        case .agencyType: return "Please select Agency Type."
        case .contactPerson: return "Please enter Conatct Person Name."
        case .phoneNumber: return "Please enter Phone Number."
        case .emailAddress: return "Please enter Email Address."
        case .faxNumber: return "Please enter Fax Number."
        case .addressLine: return "Please enter Address."
        case .state: return "Please select State."
        case .city: return "Please select City."
        case .zipcode: return "Please select Zipcode."
        case .validemail: return "Please enter valid Email Address."
        case .validAgencyName: return "Please enter valid Agency Name."
        case .validConatctPersonName: return "Please enter valid Conatct Person Name."
        }
    }
}

