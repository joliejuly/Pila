//
//  Coordinator.swift
//  Pila
//
//  Created by Julia Nikitina on 06/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

final class Coordinator {
    
    private var router: UINavigationController?
    private var factory: ModuleFactory?
    
    init(router: UINavigationController, factory: ModuleFactory) {
        self.router = router
        self.factory = factory
    }
    
    func start() {
        showLoginPromptScreen()
    }
    
    func showLoginSignInScreen(with selectedSection: SectionChosen) {
        guard let loginSignInScreen = factory?.makeLoginSignInScreen(with: selectedSection) else { return }
        loginSignInScreen.coordinator = self
        router?.pushViewController(loginSignInScreen, animated: true)
    }
    
    private func showLoginPromptScreen() {
        guard let loginPromptScreen = factory?.makeLoginPromptScreen() else { return }
        loginPromptScreen.coordinator = self
        router?.setViewControllers([loginPromptScreen], animated: true)
    }
    
}
