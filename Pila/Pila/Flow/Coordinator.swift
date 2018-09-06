//
//  Coordinator.swift
//  Pila
//
//  Created by Julia Nikitina on 06/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import Foundation

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
        let loginSignInScreen = factory?.makeLoginSignInScreen(with selectedSection: SectionChosen)
        router?.pushViewController(loginSignInScreen)
    }
    
    private func showLoginPromptScreen() {
        let loginPromptScreen = factory?.makeLoginPromptScreen()
        router?.setViewControllers([loginPromptScreen])
    }
    
}
