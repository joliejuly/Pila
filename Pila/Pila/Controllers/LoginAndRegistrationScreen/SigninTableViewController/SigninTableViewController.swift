//
//  SigninTableViewController.swift
//  Pila
//
//  Created by Julia Nikitina on 09/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

final class SigninTableViewController: UITableViewController {

    @IBOutlet weak var firstNameTextFieldView: TextFieldBottomBorderView!
    @IBOutlet weak var lastNameTextFieldView: TextFieldBottomBorderView!
    @IBOutlet weak var emailTextFieldView: TextFieldBottomBorderView!
    @IBOutlet weak var passwordTextFieldView: TextFieldBottomBorderView!
    
    private lazy var textFieldViews: [TextFieldBottomBorderView] = {
        return [firstNameTextFieldView,
                lastNameTextFieldView,
                emailTextFieldView,
                passwordTextFieldView]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFieldViews()
    }
    
    @IBAction func editingDidEnd(_ sender: PilaTextField) {
        checkInput(for: sender)
    }
    
    private func setUpTextFieldViews() {
        firstNameTextFieldView.configure(withFieldType: .firstName)
        lastNameTextFieldView.configure(withFieldType: .lastName)
        emailTextFieldView.configure(withFieldType: .email)
        passwordTextFieldView.configure(withFieldType: .password)
        
        firstNameTextFieldView.textField.delegate = self
        lastNameTextFieldView.textField.delegate = self
        emailTextFieldView.textField.delegate = self
        passwordTextFieldView.textField.delegate = self
    }

    private func checkInputs() {
        textFieldViews.forEach { textFieldView in
            textFieldView.checkIfInputIsValid(for: textFieldView.textField)
        }
    }
    
    @discardableResult
    private func checkInput(for sender: PilaTextField) -> Bool {
        
        for textFieldView in textFieldViews {
            if textFieldView.textField == sender {
                return textFieldView.checkIfInputIsValid(for: sender)
            }
        }
        return false
    }
   
}

extension SigninTableViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        guard let sender = textField as? PilaTextField else { return }
        
        //will focus on next text field if previous input was valid
        if reason == .committed, checkInput(for: sender) {
            for (index, textFieldView) in textFieldViews.enumerated() {
                if textFieldView.textField == sender, index + 1 < textFieldViews.count {
                    textFieldViews[index + 1].textField.becomeFirstResponder()
                }
            }
        }
    }
    
    //will keep user on the same text field until he enters valid email
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let sender = textField as? PilaTextField else { return false }
        
        return checkInput(for: sender)
    }
    
}
