//
//  TextFieldCheckable.swift
//  Pila
//
//  Created by Julia Nikitina on 12/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

protocol TextFieldsCheckable: AnyObject {
    var textFieldViews: [TextFieldBottomBorderView] { get set }
}

extension TextFieldsCheckable {
    
    var allInputsAreValid: Bool {
        var results = [Bool]()
        
        textFieldViews.forEach { textFieldView in
            results.append(textFieldView.checkIfInputIsValid(for: textFieldView.textField))
        }
        
        let falseResults = results.filter { $0 == false }
        return falseResults.isEmpty
    }
    
    func switchToNextTextField(from sender: PilaTextField) {
        for (index, textFieldView) in textFieldViews.enumerated() {
            if textFieldView.textField == sender, index + 1 < textFieldViews.count {
                textFieldViews[index + 1].textField.becomeFirstResponder()
            }
        }
    }
    
    @discardableResult
    func checkInput(for sender: PilaTextField) -> Bool {
        
        for textFieldView in textFieldViews {
            if textFieldView.textField == sender {
                return textFieldView.checkIfInputIsValid(for: sender)
            }
        }
        return false
    }
    
    
}
