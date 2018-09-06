//
//  LoginAndRegistrationViewController.swift
//  Pila
//
//  Created by Julia Nikitina on 06/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

final class LoginAndRegistrationViewController: UIViewController {
    
    @IBOutlet weak var loginPeak: UIImageView!
    @IBOutlet weak var signInPeak: UIImageView!
    
    @IBOutlet weak var loginSectionButton: UIButton!
    @IBOutlet weak var signInSectionButton: UIButton!
    
    var viewModel: LoginAndRegistrationViewModel = {
        return LoginAndRegistrationViewModel()
    }()
    
    weak var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews(with: viewModel.sectionChosen)
        setUpBindings()
    }
    
    @IBAction func loginSectionChosen(_ sender: UIButton) {
        setUpLoginView()
    }
    
    @IBAction func signInSectionChosen(_ sender: UIButton) {
        setUpSignInView()
    }
    
    private func setUpBindings() {
        viewModel.userDidChooseSection = { [weak self] section in
            self?.setUpViews(with: section)
        }
    }
    
    //MARK: - Helpers - Views setup
    private func setUpViews(with section: SectionChosen) {
        
        navigationController?.navigationBar.isHidden = true
        
        switch section {
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
