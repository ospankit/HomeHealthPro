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
    case DashboardVC
    case tabBarDashboard
    case SettingsVC
    case MyAccountVC
    case CliniciansVC
    case DashBoardCollectionViewCell
    case DashBoardSideMenuTableViewCell
    case DashBoardSideMenuVC
    case MainContainerController
    case ClinicianCollectionCell
    case DocumentCollectionViewCell
    case AssignedPatients
    case PatientsDetailsTableCell
}

extension Controller {
    var identifier: String {
        switch self {
        case .LoginVc: return "LoginVc"
        case .ForgetPasswordVc: return "ForgetPasswordVc"
        case .SignUpVC: return "SignUpVC"
        case .DashboardVC: return "DashboardVC"
        case .tabBarDashboard: return "TabBarDashboard"
        case .SettingsVC: return "SettingsVC"
        case .MyAccountVC: return "MyAccountVC"
        case .CliniciansVC: return "CliniciansVC"
        case .DashBoardCollectionViewCell: return "DashBoardCollectionViewCell"
        case .DashBoardSideMenuTableViewCell: return "DashBoardSideMenuTableViewCell"
        case .DashBoardSideMenuVC: return "DashBoardSideMenuVC"
        case .MainContainerController: return "MainContainerController"
        case .ClinicianCollectionCell: return "ClinicianCollectionCell"
        case .DocumentCollectionViewCell: return "DocumentCollectionViewCell"
        case .AssignedPatients: return "AssignedPatients"
        case .PatientsDetailsTableCell: return "PatientsDetailsTableCell"
        }
    }
}
