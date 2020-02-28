//
//  AppNameIdentifier.swift
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
}

extension ReuseAbleIdentifier {
    var identifier : String {
        switch self {
        case .AppNameIdentifier: return "HomeHealthPro"
        case .enterEmailAddress: return "Please enter Email Address."
        case .enterPassword: return "Please enter Password."
        case .enterUsername: return "Please enter Username."
        }
    }
}

