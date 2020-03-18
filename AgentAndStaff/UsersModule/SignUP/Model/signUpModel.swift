//
//  signUpModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 16/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

//agency model
struct DropdownDataTypeModel:Codable{
    let status:Bool
    let message:String
    let totalRecords:Int
    let data : [DropdownData]
}

struct DropdownData:Codable {
    let id : Int
    let value : String
    let order : Int
}

//master model
struct masterList:Codable {
    let `Type`:String
    let CityId:Int
    let StateId:Int
}

struct SignUpRequest:Codable {
    let AgencyName,ContactPersonName,Email,ContactNo,Fax,AddressLine,ZipCode,Password,EMRSystemName : String
    let AgencyTypeId,CityId,StateId : Int
    let IsEMRSystem,IsClinicalNotes : Bool
}

struct agencyModel:Codable {
    let status : Bool
    let message : String
    let token : String?
    let user : [userData]?
}

struct userData:Codable {
    let userId,profileId,firstName,lastName,email,role,profileImage : String
    let gender : String?
}



