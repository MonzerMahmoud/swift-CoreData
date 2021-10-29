//
//  LoginController.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 28/10/2021.
//

import UIKit

class LoginController: AbstractController {
    
    // MARK: - IB Outlets
    var welcomeLabel:UILabel!
    var dreamsQuote:UILabel!
    
    var enterNamePasswordLabel:UILabel!
    var nameLabel:UILabel!
    var nameTextField:UITextField!
    var passwordLabel:UILabel!
    var passwordTextField:UITextField!
    
    var loginButton:UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configuerUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.hideNavigationBar()
    }
    
    // MARK: - Private Functions
    private func validateInputs() -> Bool {
        
        if nameTextField.text == "" {
            showAlert(title: LocalizedStringConstant.alertText, message: LocalizedAlertConstants.nameCantBeEmpty, buttonTitle: LocalizedStringConstant.okText)
            return false
        } else if passwordTextField.text == "" {
            showAlert(title: LocalizedStringConstant.alertText, message: LocalizedAlertConstants.passwordCantBeEmpty, buttonTitle: LocalizedStringConstant.okText)
            return false
        }
        return true
    }
    
    private func validateUser() -> Bool {
        
        let userName = nameTextField.text!
        let password = passwordTextField.text!
        
        if userName != SessionManager.getUserName() {
            showAlert(title: LocalizedStringConstant.alertText, message: LocalizedAlertConstants.userNotFound, buttonTitle: LocalizedStringConstant.okText)
            return false
        } else if password != SessionManager.getUserPassword() {
            showAlert(title: LocalizedStringConstant.alertText, message: LocalizedAlertConstants.userNotFound, buttonTitle: LocalizedStringConstant.okText)
            return false
        }
        
        return true
    }
    
    
    // MARK: - Event Handler
    @objc func loginButtonPressed(_ sender:UIButton) {
        if validateInputs() {
            if validateUser() {
                
            }
        }
    }
}
