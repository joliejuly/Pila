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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTextFieldViews()
    }
    
    private func setUpTextFieldViews() {
        firstNameTextFieldView.configure(withFieldType: .firstName)
        lastNameTextFieldView.configure(withFieldType: .lastName)
        emailTextFieldView.configure(withFieldType: .email)
        passwordTextFieldView.configure(withFieldType: .password)
    }

   
}
