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
    case password = "Password"
    case firstName = "First name"
    case lastName = "Last name"
}

@IBDesignable
final class TextFieldBottomBorderView: UIView {
    
    @IBOutlet weak var textFieldLabel: UILabel!
    @IBOutlet weak var textField: PilaTextField!
    @IBOutlet weak var explainingLabel: UILabel!
    
    @IBOutlet var textFields: [PilaTextField]!
   
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
            
        case .firstName:
            textField.keyboardType = .asciiCapable
            textField.textContentType = UITextContentType.name
            
        case .lastName:
            textField.keyboardType = .asciiCapable
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
    }
    
    public func clearIndicatorView(sender: PilaTextField) {
        sender.bottomIndicatorProgress = 0.0
        explainingLabel.isHidden = true
    }
    
    
}
