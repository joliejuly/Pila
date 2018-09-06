//
//  LoginAndRegistrationViewController.swift
//  Pila
//
//  Created by Julia Nikitina on 06/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

class LoginAndRegistrationViewController: UIViewController {
    
    @IBOutlet weak var loginPeak: UIImageView!
    @IBOutlet weak var signInPeak: UIImageView!
    
    @IBOutlet weak var loginSectionButton: UIButton!
    @IBOutlet weak var signInSectionButton: UIButton!
    
    private enum SectionChosen {
        case login
        case signin
    }
    
    private var sectionChosen: SectionChosen = .login
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginSectionChosen(_ sender: UIButton) {
        setUpLoginView()
    }
    
    
    @IBAction func signInSectionChosen(_ sender: UIButton) {
        setUpSignInView()
    }
    
    
    //MARK: - Helpers - Views setup
    private func setUpViews() {
        switch sectionChosen {
        case .login:
            setUpLoginView()
        case .signin:
            setUpSignInView()
        }
    }
    
    private func setUpLoginView() {
        signInPeak.alpha = 0
        loginPeak.alpha = 1
        loginSectionButton.isEnabled = false
        signInSectionButton.isEnabled = true
        
    }
    
    private func setUpSignInView() {
        signInPeak.alpha = 1
        loginPeak.alpha = 0
        
        loginSectionButton.isEnabled = true
        signInSectionButton.isEnabled = false
    }

}
