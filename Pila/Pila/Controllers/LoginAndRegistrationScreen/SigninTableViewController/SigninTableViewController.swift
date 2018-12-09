//
//  SigninTableViewController.swift
//  Pila
//
//  Created by Julia Nikitina on 09/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

final class SigninTableViewController: UITableViewController, TextFieldsCheckable {

    @IBOutlet weak var firstNameTextFieldView: TextFieldBottomBorderView!
    @IBOutlet weak var lastNameTextFieldView: TextFieldBottomBorderView!
    @IBOutlet weak var emailTextFieldView: TextFieldBottomBorderView!
    @IBOutlet weak var passwordTextFieldView: TextFieldBottomBorderView!
    @IBOutlet weak var registrationButton: RoundedButton!
    
    lazy var textFieldViews: [TextFieldBottomBorderView] = {
        return [firstNameTextFieldView,
                lastNameTextFieldView,
                emailTextFieldView,
                passwordTextFieldView]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFieldViews()
        registrationButton.isEnabled = false
    }
    
    @IBAction func editingDidEnd(_ sender: PilaTextField) {
        checkInput(for: sender)
    }
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    private func setUpTextFieldViews() {
        firstNameTextFieldView.configure(withFieldType: .firstName)
        lastNameTextFieldView.configure(withFieldType: .lastName)
        emailTextFieldView.configure(withFieldType: .email)
        passwordTextFieldView.configure(withFieldType: .password)
        
        
        textFieldViews.forEach { textFieldView in
            textFieldView.textField.delegate = self
        }
    }
   
}

extension SigninTableViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        guard let sender = textField as? PilaTextField else { return }
        
        //will focus on next text field if previous input was valid
        if reason == .committed, checkInput(for: sender) {
            switchToNextTextField(from: sender)
        }
        
        registrationButton.isEnabled = allInputsAreValid
    }
    
    //will keep user on the same text field until he enters valid email
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        guard let sender = textField as? PilaTextField else { return false }
        
        return checkInput(for: sender)
    }
    
}
