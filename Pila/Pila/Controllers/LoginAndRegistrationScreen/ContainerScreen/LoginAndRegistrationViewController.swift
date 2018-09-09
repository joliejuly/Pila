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
    
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var signInContainerView: UIView!
    
    
    var viewModel: LoginAndRegistrationViewModel = {
        return LoginAndRegistrationViewModel()
    }()
    
    weak var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews(with: viewModel.sectionChosen, animated: false)
        setUpBindings()
    }
    
    @IBAction func loginSectionChosen(_ sender: UIButton) {
        setUpLoginView(animated: true)
    }
    
    @IBAction func signInSectionChosen(_ sender: UIButton) {
        setUpSignInView(animated: true)
    }
    
    private func setUpBindings() {
        viewModel.userDidChooseSection = { [weak self] section in
            self?.setUpViews(with: section, animated: true)
        }
    }
    
    //MARK: - Helpers - Views setup
    private func setUpViews(with section: SectionChosen, animated: Bool) {
        
        navigationController?.navigationBar.isHidden = true
        
        switch section {
        case .login:
            setUpLoginView(animated: animated)
        case .signin:
            setUpSignInView(animated: animated)
        }
    }
    
    private func setUpLoginView(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.4) {
                self.loginContainerView.alpha = 1
                self.signInContainerView.alpha = 0
                self.signInPeak.alpha = 0
                self.loginPeak.alpha = 1
            }
        } else {
            self.signInPeak.alpha = 0
            self.loginPeak.alpha = 1
            self.loginContainerView.alpha = 1
            self.signInContainerView.alpha = 0
        }
        
        loginSectionButton.isEnabled = false
        signInSectionButton.isEnabled = true

        
        
    }
    
    private func setUpSignInView(animated: Bool) {
        
        if animated {
            UIView.animate(withDuration: 0.4) {
                self.signInPeak.alpha = 1
                self.loginPeak.alpha = 0
                
                self.loginContainerView.alpha = 0
                self.signInContainerView.alpha = 1
            }
        } else {
            self.signInPeak.alpha = 1
            self.loginPeak.alpha = 0
            
            self.loginContainerView.alpha = 0
            self.signInContainerView.alpha = 1
        }

        loginSectionButton.isEnabled = true
        signInSectionButton.isEnabled = false
    }
    
    
}
