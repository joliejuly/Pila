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
    
    func configure(withFieldType type: TextFieldType) {
        textFieldLabel.text = type.rawValue
        textField.placeholder = type.rawValue
        setKeyboardType(with: type)
    }
    
    
    private func setKeyboardType(with type: TextFieldType) {
        switch type {
        case .email:
            textField.keyboardType = .emailAddress
            textField.textContentType = UITextContentType.emailAddress
        case .password:
            textField.textContentType = UITextContentType.password
        case .firstName,.lastName:
            textField.textContentType = UITextContentType.name
        }
    }
}
