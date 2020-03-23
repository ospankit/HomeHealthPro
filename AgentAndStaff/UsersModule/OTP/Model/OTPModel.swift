//
//  OTPModel.swift
//  
//
//  Created by Ankit on 19/03/20.
//

import Foundation

struct OTPModel:Codable {
    let status : Bool
    let message : String
    let token : String
    let user : UserData
}

struct UserData : Codable {
    let userId,profileId,firstName,lastName,email,role,profileImage : String
    let gender : String?
    let permissions : [PermissionsData]
}

struct PermissionsData : Codable {
    let moduleID,moduleName :String
    let isView,isEdit,isDelete :Bool
}

struct OTPCheckRequest:Codable {
    let Otp,UserId : String
}

struct OTPResendRequest:Codable {
    let UserId :String
}

struct OTPResendedModel:Codable {
    let status : Bool
    let message : String
}
