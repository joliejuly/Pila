//
//  TextFieldTableViewCell.swift
//  Pila
//
//  Created by Julia Nikitina on 08/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

enum TextFieldType: String {
    case email = "Email"
    case password = "Password"
    case firstName = "First name"
    case lastName = "Last name"
}

enum TextFieldInputError: String {
    case email = "Something is wrong with your email input"
    case weakPassword = "Password is too weak"
    case notSafePassword = "It's recommended that you add digits and uppercase letters to your password"
    case names = "Please, enter only latin characters"
}

@IBDesignable
final class TextFieldBottomBorderView: UIView {
    
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var textField: PilaTextField!
    @IBOutlet weak var explainingLabel: UILabel!
    
   
    func configure(withFieldType type: TextFieldType) {
        textFieldLabel.text = type.rawValue
        
        textField.placeholder = type.rawValue
        textField.type = type
        setKeyboardType(with: type)
        
        setUpViews()
    }
    
    private func setUpViews() {
        explainingLabel.isHidden = true
        textFieldLabel.alpha = 0
        
        textField.keyboardAppearance = .dark
        textField.returnKeyType = .continue
        textField.enablesReturnKeyAutomatically = true
        
        explainingLabel.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        setUpAccessoryView()
    }
    
    private func setUpAccessoryView() {
        let keyboardView = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 10))
        keyboardView.backgroundColor = #colorLiteral(red: 0.1084083095, green: 0.5698664188, blue: 0.9313239455, alpha: 1)
        textField.inputAccessoryView = keyboardView
    }
    
    private func setKeyboardType(with type: TextFieldType) {

        switch type {
        case .email:
            textField.keyboardType = .emailAddress
    
        case .password:
            textField.keyboardType = .asciiCapable
            textField.isSecureTextEntry = true
            textField.clearsOnInsertion = false
            
        case .firstName:
            textField.keyboardType = .asciiCapable
            
        case .lastName:
            textField.keyboardType = .asciiCapable
        }
    }
    
    
    @IBAction func editingChanged(_ sender: PilaTextField) {
        
        clearIndicatorView(sender: sender)
        
        if sender.hasText {
            UIView.animate(withDuration: 0.3) {
                self.textFieldLabel.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.textFieldLabel.alpha = 0
            }
        }
    }

    //these functions are to be called from concrete view controller
    public func setIndicatorViewToApproved(sender: PilaTextField) {
        explainingLabel.isHidden = true
        sender.bottomIndicatorBorderColor = #colorLiteral(red: 0, green: 0.7932798266, blue: 0.6872220635, alpha: 1)
        sender.bottomIndicatorProgress = 1.0
    }
    
    public func setErrorIndicatorView(sender: PilaTextField, errorType: TextFieldInputError) {
        
        sender.bottomIndicatorProgress = 0.7
        sender.bottomIndicatorBorderColor = #colorLiteral(red: 0.7590078712, green: 0.1141509339, blue: 0.2868707478, alpha: 1)
        explainingLabel.isHidden = false
        explainingLabel.text = errorType.rawValue
        
        if errorType == .notSafePassword {
            sender.bottomIndicatorBorderColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        }
        
        if errorType == .weakPassword {
            sender.bottomIndicatorProgress = 0.4
        }
        
        
    }
    
    public func clearIndicatorView(sender: PilaTextField) {
        sender.bottomIndicatorProgress = 0.0
        explainingLabel.isHidden = true
    }
    
    
    @discardableResult
    public func checkIfInputIsValid(for textField: UITextField) -> Bool {
        
        guard let sender = textField as? PilaTextField else { return false }
        
        guard let type = sender.type, sender.hasText, let text = sender.text
            else {
                clearIndicatorView(sender: sender)
                return false
        }
        
        switch type {
        case .email:
            return checkEmailImputIsValid(with: text, for: sender)
        case .firstName, .lastName:
            return checkNamesImputIsValid(with: text, for: sender)
        case .password:
            return checkPasswordStrength(with: text, for: sender)
        }
    }
    
    @discardableResult
    private func checkNamesImputIsValid(with text: String, for sender: PilaTextField) -> Bool {
        
        if text.latinCharactersOnly {
            setIndicatorViewToApproved(sender: sender)
            return true
        } else {
            setErrorIndicatorView(sender: sender, errorType: .names)
            return false
        }
    }
    
    private func checkPasswordStrength(with text: String, for sender: PilaTextField) -> Bool {
        switch text.strengthOfPassword {
        case 0.0...0.5:
            setErrorIndicatorView(sender: sender, errorType: .weakPassword)
            return false
        case 0.6...0.7:
            setErrorIndicatorView(sender: sender, errorType: .notSafePassword)
            return true
        case 0.8...1.0:
            setIndicatorViewToApproved(sender: sender)
            return true
        default:
            return true
        }
        
    }
    
    @discardableResult
    private func checkEmailImputIsValid(with text: String, for sender: PilaTextField) -> Bool {
        
        guard sender.type == .email else { return false }
        
        if text.isEmail {
            setIndicatorViewToApproved(sender: sender)
            return true
        } else {
            setErrorIndicatorView(sender: sender, errorType: .email)
            return false
        }
    }
    
}
