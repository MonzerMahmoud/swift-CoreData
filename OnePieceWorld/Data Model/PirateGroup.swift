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
    
    init(name:String,captin:String) {
        self.name = name
        self.captin = captin
    }
}
