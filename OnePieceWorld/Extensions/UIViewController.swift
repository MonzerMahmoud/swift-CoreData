//
//  UIViewController.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 29/10/2021.
//

import UIKit

extension UIViewController: UIPopoverPresentationControllerDelegate {
    
    @objc func showAlert(title: String, message: String, buttonTitle: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func showAlert(title: String, message: String, buttonTitle: String, buttonAction: @escaping () -> Void){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: buttonTitle, style: .default) { (_) in
            buttonAction()
        }
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }
}
