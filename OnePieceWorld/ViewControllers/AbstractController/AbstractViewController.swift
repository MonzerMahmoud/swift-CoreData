//
//  AbstractViewController.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 28/10/2021.
//

import UIKit

class AbstractController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func hideNavigationBar() {
        self.navigationController?.navigationBar.isHidden = true
    }

    func showNavigationBar() {
        self.navigationController?.navigationBar.isHidden = false
    }
}
