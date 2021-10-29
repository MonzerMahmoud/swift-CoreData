//
//  LoginController+UIExtension.swift
//  OnePieceWorld
//
//  Created by Syber Expertise on 28/10/2021.
//

import UIKit

extension LoginController {
    
    func configuerUI() {
        initViews()
        anchorViews()
    }
    
    func initViews() {
        
        welcomeLabel = {
           let label = UILabel()
            label.text = LocalizedStringConstant.welcomeText
            label.font = UIFont.boldSystemFont(ofSize: 30)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        dreamsQuote = {
          let label = UILabel()
            label.text = QuotesStringConstant.dreamsQuote
            label.font = UIFont.italicSystemFont(ofSize: 20)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        enterNamePasswordLabel = {
           let label = UILabel()
            label.text = LocalizedStringConstant.enterNameAndPasswordText
            label.font = UIFont.boldSystemFont(ofSize: 20)
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        nameLabel = {
           let label = UILabel()
            label.text = LocalizedStringConstant.userNameText
            label.font = UIFont.boldSystemFont(ofSize: 15)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        nameTextField = {
           let text = UITextField()
            text.placeholder = LocalizedStringConstant.userNameText
            text.font = UIFont.boldSystemFont(ofSize: 13)
            text.borderStyle = .roundedRect
            text.translatesAutoresizingMaskIntoConstraints = false
            return text
        }()
        
        passwordLabel = {
           let label = UILabel()
            label.text = LocalizedStringConstant.passwordText
            label.font = UIFont.boldSystemFont(ofSize: 15)
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        passwordTextField = {
           let text = UITextField()
            text.placeholder = LocalizedStringConstant.passwordText
            text.font = UIFont.boldSystemFont(ofSize: 13)
            text.isSecureTextEntry = true
            text.borderStyle = .roundedRect
            text.translatesAutoresizingMaskIntoConstraints = false
            return text
        }()
        
        loginButton = {
           let button = UIButton()
            button.setTitle(LocalizedStringConstant.loginText, for: .normal)
            //button.setTitle(LocalizedStringConstant.logining, for: .highlighted)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 0.5
            button.layer.borderColor = UIColor.gray.cgColor
            button.layer.cornerRadius = 10
            //button.backgroundColor = UIColor.blue
            button.addTarget(self, action: #selector(loginButtonPressed(_:)), for: .touchUpInside)
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
    }
    
    func anchorViews() {
        
        let safeArea = view.safeAreaLayoutGuide
        
        view.addSubview(welcomeLabel)
        welcomeLabel.topAnchor.constraint(equalTo: safeArea.topAnchor, constant: 50).isActive = true
        welcomeLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        view.addSubview(dreamsQuote)
        dreamsQuote.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 20).isActive = true
        dreamsQuote.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        
        view.addSubview(enterNamePasswordLabel)
        enterNamePasswordLabel.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        enterNamePasswordLabel.centerYAnchor.constraint(equalTo: safeArea.centerYAnchor, constant: -100).isActive = true
        enterNamePasswordLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor).isActive = true
        enterNamePasswordLabel.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor).isActive = true
        
        view.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: enterNamePasswordLabel.bottomAnchor, constant: 30).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -20).isActive = true
        
        view.addSubview(nameTextField)
        nameTextField.topAnchor.constraint(equalTo: nameLabel.topAnchor).isActive = true
        nameTextField.leadingAnchor.constraint(equalTo: nameLabel.trailingAnchor, constant: 0).isActive = true
        nameTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50).isActive = true
        nameTextField.bottomAnchor.constraint(equalTo: nameLabel.bottomAnchor).isActive = true
        
        view.addSubview(passwordLabel)
        passwordLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 25).isActive = true
        passwordLabel.leadingAnchor.constraint(equalTo: safeArea.leadingAnchor, constant: 30).isActive = true
        passwordLabel.trailingAnchor.constraint(equalTo: safeArea.centerXAnchor, constant: -20).isActive = true
        
        view.addSubview(passwordTextField)
        passwordTextField.topAnchor.constraint(equalTo: passwordLabel.topAnchor).isActive = true
        passwordTextField.leadingAnchor.constraint(equalTo: passwordLabel.trailingAnchor, constant: 0).isActive = true
        passwordTextField.trailingAnchor.constraint(equalTo: safeArea.trailingAnchor, constant: -50).isActive = true
        passwordTextField.bottomAnchor.constraint(equalTo: passwordLabel.bottomAnchor).isActive = true
        
        view.addSubview(loginButton)
        loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive = true
        loginButton.centerXAnchor.constraint(equalTo: safeArea.centerXAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.widthAnchor.constraint(equalToConstant: 80).isActive = true
    }
}
