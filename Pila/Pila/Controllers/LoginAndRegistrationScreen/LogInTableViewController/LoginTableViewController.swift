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
        guard let type = sender.type, sender.hasText, let text = sender.text
            else {
                emailTextFieldView.clearIndicatorView(sender: sender)
                return
        }
        
        switch type {
            case .email:
                if text.isEmail {
                    emailTextFieldView.setIndicatorViewToApproved(sender: sender)
                    textFields.forEach { textField in
                        if textField.type == .password {
                            textField.becomeFirstResponder()
                        }
                    }
                } else {
                    emailTextFieldView.setErrorIndicatorView(sender: sender, errorType: .email)
                }
            default: break
        }
        
    }
    
    
    //MARK: - Helpers
    private func setUpViews() {
        
        UIApplication.shared.statusBarView?.backgroundColor = #colorLiteral(red: 0.1084083095, green: 0.5698664188, blue: 0.9313239455, alpha: 1)
        
        passwordTextFieldView.configure(withFieldType: .password)
        emailTextFieldView.configure(withFieldType: .email)
    }

}

extension LoginTableViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        view.endEditing(true)
    }
    
    
}
