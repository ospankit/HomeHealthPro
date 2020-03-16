//
//  signUpModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 16/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

struct AgencyTypeModel:Codable{
    let status:Bool
    let message:String
    let totalRecords:Int
    let data : [dataArray]
}

struct dataArray:Codable {
    let id : Int
    let value : String
    let order : Int
}

struct masterList:Codable {
    let `Type`:String
    let CityId:Int
    let StateId:Int
}
