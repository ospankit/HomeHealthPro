//
//  DashboardModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 19/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

struct DashboardModel:Codable {
    let status : Bool
    let message :String
    let data : DashBoardData
    let totalRecords : Int
}

struct DashBoardData:Codable {
    let dashboardTotalCounterCards : [DashboardTotalCounterCardsData]
    let recentlyScheduledVisit : [recentlyScheduledVisitData]?
}

struct DashboardTotalCounterCardsData:Codable {
    let key,value :String
}

struct recentlyScheduledVisitData :Codable {
    let key,value :String
}

struct AgencyDashboardRequest:Codable {
    let ClinicianId,FromDate,ToDate : String
}
