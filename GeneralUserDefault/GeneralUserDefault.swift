//
//  GeneralUserDefault.swift
//  HomeHealthPro
//
//  Created by Ankit on 19/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import Foundation

class GeneralUserDefaultsManager {
    fileprivate static let IS_Login = "isLogin"
    fileprivate static let TOKEN = "token"
    fileprivate static let UserId = "userId"
    fileprivate static let ProfileId = "profileId"
    fileprivate static let FirstName = "firstName"
    fileprivate static let LastName = "lastName"
    fileprivate static let Gender = "gender"
    fileprivate static let Email = "email"
    fileprivate static let Role = "role"
    fileprivate static let ProfileImage = "profileImage"
    
    static let sharedInstance = GeneralUserDefaultsManager()
    fileprivate init(){}
    
    let userDefaults = UserDefaults.standard
    
    var isLogin:Bool {
        get{return userDefaults.bool(forKey: GeneralUserDefaultsManager.IS_Login)}
        set {userDefaults.set(newValue, forKey: GeneralUserDefaultsManager.IS_Login)}
    }
    
    var token:String {
        get{
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.TOKEN) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue,forKey: GeneralUserDefaultsManager.TOKEN)}
    }
    
    var profileId:String {
        get{
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.ProfileId) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue,forKey: GeneralUserDefaultsManager.ProfileId)}
    }
    
    var userId:String {
        get {
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.UserId) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue, forKey: GeneralUserDefaultsManager.UserId)}
    }
    
    var  firstName:String {
        get {
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.FirstName) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue, forKey: GeneralUserDefaultsManager.FirstName)}
    }
    
    var lastName:String {
        get {
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.LastName) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue, forKey: GeneralUserDefaultsManager.LastName)}
    }
    
    var gender:String {
        get {
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.Gender) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue, forKey: GeneralUserDefaultsManager.Gender)}
    }
    
    var email:String {
        get {
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.Email) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue, forKey: GeneralUserDefaultsManager.Email)}
    }
    
    var role:String {
        get {
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.Role) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue, forKey: GeneralUserDefaultsManager.Role)}
    }
    
    var profileImage:String {
        get {
            if let value = userDefaults.string(forKey: GeneralUserDefaultsManager.ProfileImage) {
                return value
            }else {
                return ""
            }
        }
        set {userDefaults.set(newValue, forKey: GeneralUserDefaultsManager.ProfileImage)}
    }
    
    func cleanLoginData() {
        userDefaults.set(false, forKey: GeneralUserDefaultsManager.IS_Login)
        userDefaults.set("", forKey: GeneralUserDefaultsManager.TOKEN)
        userDefaults.set("", forKey: GeneralUserDefaultsManager.UserId)
        userDefaults.set("", forKey: GeneralUserDefaultsManager.ProfileId)
        
    }
    
}
