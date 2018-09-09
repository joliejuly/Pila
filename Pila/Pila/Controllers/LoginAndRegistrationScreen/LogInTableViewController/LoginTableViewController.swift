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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextFieldView.configure(withFieldType: .email)
    passwordTextFieldView.configure(withFieldType: .password)
        
        emailTextFieldView.textField.delegate = self
        passwordTextFieldView.textField.delegate = self
        
    }
}

extension LoginTableViewController: UITextFieldDelegate {
    
}
