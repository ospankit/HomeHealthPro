//
//  AssignedPatientsModel.swift
//  HomeHealthPro
//
//  Created by ankit shelar on 22/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

struct AssignedPatientsModel:Codable {
    let status : Bool
    let message : String
    let data : [PatientData]
    let recordsTotal,recordsFiltered : Int
    let listCounts : String?
    let draw : String
    
}

struct PatientData:Codable {
    let patientId,name,dob,patientType,phone,emergencyContactName,emergencyContactNo,gender,email,address,city,state,zipcode,insuranceType,diagnosis :String
    let patientTypeId,cityId,stateId : Int
    let maskedPatientName : String?
}
