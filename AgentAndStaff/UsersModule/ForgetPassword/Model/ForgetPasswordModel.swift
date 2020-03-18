//
//  ForgetPasswordModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 18/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

struct ForgetPasswordModel:Codable {
    let message : String
    let data : String
    let status : Bool
}

struct ForgetPasswordRequest:Codable {
    let Email :String
}
