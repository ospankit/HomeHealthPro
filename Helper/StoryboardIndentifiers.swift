//
//  Storyboard .swift
//  HomeHealthPro
//
//  Created by Ankit on 27/02/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

enum StoryBoard {
    case Login
    case Dashboard
    case patients
    case ChangePassword
    case ScheduleVisit
    case ResetPassword
}

extension StoryBoard {
    var indentifier : String {
        switch self {
        case .Login: return "Login"
        case .Dashboard: return "Dashboard"
        case .patients: return "patients"
        case .ChangePassword: return "ChangePassword"
        case .ScheduleVisit: return "ScheduleVisit"
        case .ResetPassword: return "ResetPassword"
        }
    }
}
