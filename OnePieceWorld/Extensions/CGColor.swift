//
//  CGColor.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 29/10/2021.
//

import UIKit

extension UIColor {
    
    func toCGColor() -> CGColor {
        return self.cgColor
    }
    
    func toCIColor() -> CIColor {
        return self.ciColor
    }
    
}
