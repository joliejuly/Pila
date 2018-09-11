//
//  LoginTableViewController.swift
//  Pila
//
//  Created by Julia Nikitina on 09/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

final class LoginTableViewController: UITableViewController {

    @IBOutlet weak var emailTextFieldView: TextFieldBottomBorderView!
    @IBOutlet weak var passwordTextFieldView: TextFieldBottomBorderView!
    
    @IBOutlet var textFields: [PilaTextField]!
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()

        emailTextFieldView.textField.delegate = self
        passwordTextFieldView.textField.delegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        view.endEditing(true)
    }
    
    
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        view.endEditing(true)
    }
    
    //MARK: - Actions
    
    @IBAction func editingDidEnd(_ sender: PilaTextField) {
        emailTextFieldView.checkIfInputIsValid(for: sender)
    }
    
    @IBAction func continueButtonTapped(_ sender: RoundedButton) {
        
        //todo: show the payment screen
    }
    
    //MARK: - Helpers
    private func setUpViews() {
        
        UIApplication.shared.statusBarView?.backgroundColor = #colorLiteral(red: 0.1084083095, green: 0.5698664188, blue: 0.9313239455, alpha: 1)
        
        passwordTextFieldView.configure(withFieldType: .password)
        emailTextFieldView.configure(withFieldType: .email)
    }
    
    private func makeFirstResponderTextField(withType type: TextFieldType) {
        textFields.forEach { textField in
            if textField.type == type {
                textField.becomeFirstResponder()
            }
        }
    }
}

extension LoginTableViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        
        //will focus on next text field only after email editing
        if reason == .committed, emailTextFieldView.checkIfInputIsValid(for: textField) {
            
            guard let sender = textField as? PilaTextField else { return }
            
            if sender.type == .email {
                 makeFirstResponderTextField(withType: .password)
            }
        }
    }
    
    //will keep user on the same text field until he enters valid email
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        return emailTextFieldView.checkIfInputIsValid(for: textField)
    }
    
}
