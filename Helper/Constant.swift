//
//  Constant.swift
//  HomeHealthPro
//
//  Created by Ankit on 04/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

enum Constant{
    case Visible
    case Invisible
    case termsAndCondition
    case iAcceptAllThe
    case toAccessThisApplication
    case searchClinianPlaceHolder
    case TotalClinicians
    case ActiveClinicians
    case InactiveClicians
}

extension Constant {
    var identifier:String {
        switch self {
        case .Visible: return "Visible"
        case .Invisible: return "Invisible"
        case .termsAndCondition: return "terms and conditions "
        case .iAcceptAllThe: return "I accept all the "
        case .toAccessThisApplication: return "to access this application"
        case .searchClinianPlaceHolder: return "Search Clinician Here"
        case .TotalClinicians: return " Total Clinicians"
        case .ActiveClinicians: return " Active Clinicians"
        case .InactiveClicians: return " Inactive Clinicians"
        }
    }
}

enum fontConstant {
    case SFProDisplayRegular
    case SFProDisplayBold
}

extension fontConstant {
    var identifier:String {
        switch self {
        case .SFProDisplayRegular: return "SFProDisplay-Regular"
        case .SFProDisplayBold: return "SFProDisplay-Bold"
        }
    }
}

enum imageConstant {
    case Menu
    case Dashboard
    case Search
}

extension imageConstant {
    var identifier:String {
        switch self {
        case .Menu: return "Menu"
        case .Dashboard: return "Dashboard"
        case .Search: return "Search"
        }
    }
}
