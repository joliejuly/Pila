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
        textFieldLabel.alpha = 0
        textField.placeholder = type.rawValue
        textField.type = type
        setKeyboardType(with: type)
        explainingLabel.isHidden = true
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
        
        if sender.hasText {
            UIView.animate(withDuration: 0.3) {
                self.textFieldLabel.alpha = 1
            }
        } else {
            UIView.animate(withDuration: 0.3) {
                self.textFieldLabel.alpha = 0
            }
        }
        
        guard let type = sender.type, let text = sender.text else { return }
        
        switch type {
        case .email:
            if text.isEmail {
                explainingLabel.isHidden = true
                sender.bottomBorderColor = #colorLiteral(red: 0.8630058169, green: 0.9392105937, blue: 0.9747415185, alpha: 1)
            } else {
                sender.bottomBorderColor = #colorLiteral(red: 0.7590078712, green: 0.1141509339, blue: 0.2868707478, alpha: 1)
                explainingLabel.isHidden = false
                explainingLabel.text = "Something is wrong with your email input"
            }
            
        default: break
        }
        
        
    }
}
