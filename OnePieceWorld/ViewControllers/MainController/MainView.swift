//
//  MainView.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 28/10/2021.
//

import UIKit

class MainView: AbstractController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        PirateBaseModel.singeltonPirate.newPirate = Pirate(name: "Luffy", bounty: 0, group: PirateGroup(name: "Straw Hats", captin: "Luffy"))
        
        for group in PirateBaseModel.singeltonPirate.piratesList {
            print("Group Name: \(group.name)")
            print("Group Captin: \(group.bounty)")
        }
        
        for group in PirateGroupBaseModel.singeltonPirateGroup.pirateGroupsList {
            print("Group Name: \(group.name)")
            print("Group Captin: \(group.captin)")
        }
        
        
    }
}
