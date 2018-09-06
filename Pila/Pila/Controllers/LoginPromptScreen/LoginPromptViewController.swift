//
//  LoginPromptViewController.swift
//  Pila
//
//  Created by Julia Nikitina on 05/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

final class LoginPromptViewController: UIViewController {

    weak var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginScreenTapped(_ sender: RoundedButton) {
        coordinator?.showLoginSignInScreen(with: .login)
    }
    
    @IBAction func signUpButtonTapped(_ sender: RoundedButton) {
        coordinator?.showLoginSignInScreen(with: .signin)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
