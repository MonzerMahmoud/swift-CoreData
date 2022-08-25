//
//  PirateModel.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 01/11/2021.
//

import Foundation
import CoreData
class Pirate: Codable {
    var name: String = ""
    var bounty:Int16 = 0
    var group:PirateGroup?
    
    init(name:String,bounty:Int16,group:PirateGroup) {
        self.name = name
        self.bounty = bounty
        self.group = group
    }
    
    init(name:String,bounty:Int16) {
        self.name = name
        self.bounty = bounty
        self.group = nil
    }
}

class PirateBaseModel {
    
    static let singeltonPirate = PirateBaseModel()
    
    var piratesList:[Pirate] {
        return PirateBaseModel.loadPirates()
    }
    
    var newPirate:Pirate? {
        didSet {
            if let pirate = newPirate {
                PirateBaseModel.savePirate(pirate: pirate)
            }
        }
    }
}

extension PirateBaseModel {
    fileprivate static func loadPirates() -> [Pirate] {
        
        var pirates:[Pirate] = []
        
        for pirate in loadPiratesContext() {
            pirates.append(Pirate(name: pirate.name!, bounty: pirate.bounty, group: PirateGroup(name: pirate.pirateGroup?.name ?? "", captin: pirate.pirateGroup?.captin ?? "")))
        }
        
        return pirates
    }
    
    fileprivate static func savePirate(pirate: Pirate) {
        let pirateCoreModel = PirateCoreModel(context: SessionManager.context)
        if pirate.group == nil {
            pirateCoreModel.name = pirate.name
            pirateCoreModel.bounty = pirate.bounty
            PirateGroupBaseModel.singeltonPirateGroup.newPirateGroup = pirate.group
            
        } else {
            pirateCoreModel.name = pirate.name
            pirateCoreModel.bounty = pirate.bounty
            savePirateContext()
        }
    }
    
    fileprivate static func loadPiratesContext() -> [PirateCoreModel] {
        let request:NSFetchRequest<PirateCoreModel> = PirateCoreModel.fetchRequest()
        
        do {
            print("Succ")
            return try SessionManager.context.fetch(request)
        } catch {
            print("Error fetching data from context \(error)")
        }
        return []
    }
    
    fileprivate static func savePirateContext() {
        do {
            print("Succ")
            try SessionManager.context.save()
        } catch {
            print("Error saving context \(error)")
        }
    }
}
