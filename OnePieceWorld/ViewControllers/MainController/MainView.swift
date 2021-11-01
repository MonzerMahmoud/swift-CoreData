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
        
        for group in SessionManager.loadPirateGroups() {
            print("Group Name: \(group.name)")
            print("Group Captin: \(group.captin)")
        }
        
        
    }
}
