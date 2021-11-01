//
//  SessionManager.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 28/10/2021.
//

import UIKit
import CoreData
class SessionManager {
    
    let defaults = UserDefaults.standard
    
    static let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
    
    static let profileFilePath = dataFilePath?.appendingPathComponent("UserProfile.plist")
    
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
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
    
    static func savePirateGroup(group: PirateGroup) {
        let groupCoreModel = PirateGroupCoreModel(context: context)
        groupCoreModel.name = group.name
        groupCoreModel.captin = group.captin
        savePirateGroupContext()
    }
    
    static func loadPirateGroups() -> [PirateGroup] {
        let groupsCoreModel = loadPirateGroupContext()
        var groupModel:[PirateGroup] = []
        
        for group in groupsCoreModel {
            groupModel.append(PirateGroup.init(name: group.name ?? "", captin: group.captin ?? ""))
        }
        
        return groupModel
    }
    
    static func updatePirateGroupCaptin(withName name:String, NewCaptin captin:String) {
        
        for group in loadPirateGroupContext() {
            if group.name == name {
                group.captin = captin
                savePirateGroupContext()
                return
            }
        }
    }
        
}

extension SessionManager {
    fileprivate static func encodeUserProfileToFileNSCoder(profile:User,filePath:URL) {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(profile)
            try data.write(to: filePath)
        } catch {
            print("Error encoding cars array, \(error)")
        }
    }
    
    fileprivate static func decodeUserProfileFromFileNSCoder(filePath:URL) -> User {
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

extension SessionManager {
    
    fileprivate static func savePirateGroupContext() {
        do {
            print("Succ")
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    fileprivate static func loadPirateGroupContext() -> [PirateGroupCoreModel] {
        let request : NSFetchRequest<PirateGroupCoreModel> = PirateGroupCoreModel.fetchRequest()
        do {
            print("Succ")
            return try context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        return []
    }
}
