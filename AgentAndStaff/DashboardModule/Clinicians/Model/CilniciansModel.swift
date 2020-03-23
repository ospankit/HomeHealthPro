//
//  CilniciansModel.swift
//  HomeHealthPro
//
//  Created by ankit shelar on 20/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

struct CilniciansModel: Codable {
    let status: Bool
    let message: String
    let data: [ClinicianData]
    let recordsTotal, recordsFiltered: Int
    let draw: String
    let listCounts: ListCounts
}

struct ClinicianData: Codable {
    let averageRating: Double
    let totalRatings: Int
    let userID, clinicianID, email, firstName: String
    let lastName: String?
    let fullName: String
    let gender: String
    let dob: String?
    let contactNo: String
    let alternateContactNo: String?
    let active: Bool
    let addressLine, city: String
    let cityID: Int
    let state, stateCode: String
    let stateID: Int
    let zipCode: String
    let patientType: String
    let patientTypeID: Int
    let backgroudVerficationStatus: Bool
    let perVisitRate: Double
    let perDischargeRate, perEvaluationRate: Int
    let profileImage, createdOn: String
    let updatedBy: String?
    let categories: String
    let languages: String
    let opr: String?
    let lat, lng: Double

    enum CodingKeys: String, CodingKey {
        case averageRating, totalRatings
        case userID = "userId"
        case clinicianID = "clinicianId"
        case email, firstName, lastName, fullName, gender, dob, contactNo, alternateContactNo, active, addressLine, city
        case cityID = "cityId"
        case state, stateCode
        case stateID = "stateId"
        case zipCode, patientType
        case patientTypeID = "patientTypeId"
        case backgroudVerficationStatus, perVisitRate, perDischargeRate, perEvaluationRate, profileImage, createdOn, updatedBy, categories, languages, opr, lat, lng
    }
}

struct ListCounts: Codable {
    let total, totalActive, totalInActive: Int
}

struct ClinicianListRequest:Codable {
    let Gender,SortCol,SearchKey :String
    let PatientTypeId,CategoryId,LanguageId,Start,PageSize :Int
    let Active : Bool?
}
