//
//  SessionManager.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 28/10/2021.
//

import Foundation

class SessionManager {
    
    let defaults = UserDefaults.standard
    
    static func setUserName(userName: String){
        UserDefaults.standard.set(userName, forKey: UserDefaultKeys.userNameKey)
    }
    
    static func getUserName() -> String {
        if let userName = UserDefaults.standard.string(forKey: UserDefaultKeys.userNameKey) {
            return userName
        }
         return ""
    }
    
    static func setUserLoggedIn(){
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.isUserLoggedIn)
    }
    
    static func getUserLoggedStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaultKeys.isUserLoggedIn)
    }
    
    static func setPassword(password: String){
        UserDefaults.standard.set(password, forKey: UserDefaultKeys.passwordKey)
    }
    
    static func getUserPassword() -> String {
        if let password = UserDefaults.standard.string(forKey: UserDefaultKeys.userNameKey) {
            return password
        }
         return ""
    }
    
        
}
