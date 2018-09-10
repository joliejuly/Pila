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
            textField.isSecureTextEntry = true
            
        case .firstName,.lastName:
            textField.textContentType = UITextContentType.name
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
    
    
    @IBAction func editingDidEnd(_ sender: PilaTextField) {
        guard let type = sender.type, sender.hasText, let text = sender.text
            else {
                clearIndicatorView(sender: sender)
                return
            }
        
        switch type {
        case .email:
            if text.isEmail {
                explainingLabel.isHidden = true
                sender.bottomIndicatorBorderColor = #colorLiteral(red: 0, green: 0.7932798266, blue: 0.6872220635, alpha: 1)
            } else {
                sender.bottomIndicatorBorderColor = #colorLiteral(red: 0.7590078712, green: 0.1141509339, blue: 0.2868707478, alpha: 1)
                explainingLabel.isHidden = false
                explainingLabel.text = "Something is wrong with your email input"
            }
            
        default: break
        }
        
    }
    
    
    
    
    private func clearIndicatorView(sender: PilaTextField) {
        sender.bottomIndicatorBorderColor = .clear
        explainingLabel.isHidden = true
    }
    
    
}
