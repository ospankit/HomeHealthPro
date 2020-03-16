//
//  LoginModel.swift
//  HomeHealthPro
//
//  Created by Ankit on 13/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

struct LoginModel: Codable {
    let userID, message: String
    let status: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case message, status
    }
}

struct LoginRequest:Codable {
    let Email,Password : String
    let IsWebLogin : Bool
}


