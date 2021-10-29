//
//  SessionManager.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 28/10/2021.
//

import Foundation

class SessionManager {
    
    let defaults = UserDefaults.standard
    
    static let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    static let profileFilePath = dataFilePath?.appendingPathComponent("UserProfile.plist")
    
    static func removeUserPersistentInfos() {
        setUserLoggedOut()
        removeUserName()
        removePassword()
        removeUserProfile()
    }
    
    static func setUserName(userName: String){
        UserDefaults.standard.set(userName, forKey: UserDefaultKeys.userNameKey)
    }
    
    static func getUserName() -> String {
        if let userName = UserDefaults.standard.string(forKey: UserDefaultKeys.userNameKey) {
            return userName
        }
         return ""
    }
    
    static func removeUserName() {
        setUserName(userName: "")
    }
    
    static func setUserLoggedIn() {
        UserDefaults.standard.set(true, forKey: UserDefaultKeys.isUserLoggedIn)
    }
    
    static func getUserLoggedStatus() -> Bool {
        return UserDefaults.standard.bool(forKey: UserDefaultKeys.isUserLoggedIn)
    }
    
    static func setUserLoggedOut() {
        UserDefaults.standard.set(false, forKey: UserDefaultKeys.isUserLoggedIn)
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
    
    static func removePassword(){
        setPassword(password: "")
    }
    
    static func setUserProfile(user:User) {
        encodeUserProfileToFileNSCoder(profile: user, filePath: profileFilePath!)
    }
    
    static func getUserProfile() -> User {
        if getUserLoggedStatus() {
            return decodeUserProfileFromFileNSCoder(filePath: profileFilePath!)
        } else {
            print("User not logged in ...")
        }
        return User(name: "", type: "")
    }
    
    static func removeUserProfile() {
        setUserProfile(user: User(name: "", type: ""))
    }
    
        
}

extension SessionManager {
    static func encodeUserProfileToFileNSCoder(profile:User,filePath:URL) {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(profile)
            try data.write(to: filePath)
        } catch {
            print("Error encoding cars array, \(error)")
        }
    }
    
    static func decodeUserProfileFromFileNSCoder(filePath:URL) -> User {
        var user = User(name: "", type: "")
        if let data = try? Data(contentsOf: filePath) {
            let decoder = PropertyListDecoder()
            do {
                user = try decoder.decode(User.self, from: data)
                return user
            } catch {
                print("Error decoding user profile, \(error)")
                return user
            }
        }
        return user
    }
}
