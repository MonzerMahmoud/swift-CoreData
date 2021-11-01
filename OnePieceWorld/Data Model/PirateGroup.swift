//
//  PirateGroup.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 30/10/2021.
//

import Foundation
import CoreData

//class PirateGroupCoreModel: NSManagedObject {
//
//}
class PirateGroup: Codable {
    var name: String = ""
    var captin: String = ""
    
    init() {
        self.name = ""
        self.captin = ""
    }
    init(name:String,captin:String) {
        self.name = name
        self.captin = captin
    }
}

class PirateGroupBaseModel {
    
    static let pirateGroup = PirateGroup()
    
    static let singeltonPirateGroup = PirateGroupBaseModel()
    
    var pirateGroupsList:[PirateGroup] {
        return PirateGroupBaseModel.loadPirateGroups()
    }
    
    var newPirateGroup:PirateGroup? {
        didSet {
            if let pirateGroup = newPirateGroup {
                PirateGroupBaseModel.savePirateGroup(group: pirateGroup)
            }
        }
    }
    
    var changePirateGroupCaptin: [String:String]? {
        didSet {
            if let group = changePirateGroupCaptin {
                for groupName in group.keys {
                    PirateGroupBaseModel.updatePirateGroupCaptin(withName: groupName, NewCaptin: group[groupName]!)
                }
            }
        }
    }
    
    var deletePirateGroup: String? {
        didSet {
            if let groupName = deletePirateGroup {
                PirateGroupBaseModel.deletePirateGroup(withName: groupName)
            }
        }
    }
    
    
}

extension PirateGroupBaseModel {
    
    fileprivate static func loadPirateGroups() -> [PirateGroup] {
        
        var groupModel:[PirateGroup] = []
        
        for group in loadPirateGroupContext() {
            groupModel.append(PirateGroup.init(name: group.name ?? "", captin: group.captin ?? ""))
        }
        
        return groupModel
    }
    
    fileprivate static func savePirateGroup(group: PirateGroup) {
        let groupCoreModel = PirateGroupCoreModel(context: SessionManager.context)
        groupCoreModel.name = group.name
        groupCoreModel.captin = group.captin
        savePirateGroupContext()
    }
    
    fileprivate static func updatePirateGroupCaptin(withName name:String, NewCaptin captin:String) {
        
        if let group = findPirateGroup(withName: name) {
            group.captin = captin
            savePirateGroupContext()
        }
    }
    
    fileprivate static func deletePirateGroup(withName name:String) {
        if let group = findPirateGroup(withName: name) {
            SessionManager.context.delete(group)
            savePirateGroupContext()
        }
    }
    
    fileprivate static func loadPirateGroupContext(with request: NSFetchRequest<PirateGroupCoreModel> = PirateGroupCoreModel.fetchRequest()) -> [PirateGroupCoreModel] {
        
        do {
            print("Succ")
            return try SessionManager.context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        return []
    }
    
    fileprivate static func savePirateGroupContext() {
        do {
            print("Succ")
            try SessionManager.context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
    
    fileprivate static func findPirateGroup(withName name:String) -> PirateGroupCoreModel? {
        for group in loadPirateGroupContext() {
            if group.name == name {
                return group
            }
        }
        return nil
    }
    
    fileprivate static func findGroupsWithSpecs(withSpecs specs:CVaListPointer) {
        let request : NSFetchRequest<PirateGroupCoreModel> = PirateGroupCoreModel.fetchRequest()
        
        request.predicate = NSPredicate(format: "name CONTAINS[cd] %@", arguments: specs)
        
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        
        let _ = loadPirateGroupContext(with: request)
    }
}
