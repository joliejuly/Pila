//
//  ModuleFactory.swift
//  Pila
//
//  Created by Julia Nikitina on 06/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

final class ModuleFactory {
    
    func makeLoginPromptScreen() -> LoginPromptViewController {
        guard
            let loginPromptScreen = instantiateModule(
                from: .loginPrompt,
                withID: .loginPrompt) as? LoginPromptViewController
            else { fatalError("Cannot instantiate LoginPromptScreen") }
        return loginPromptScreen
    }
    
    func makeLoginSignInScreen(
        with selectedSection: SectionChosen)
        -> LoginAndRegistrationViewController {
        guard
            let loginSignInScreen = instantiateModule(
                from: .loginAndRegistration,
                withID: .loginAndRegistration)
            as? LoginAndRegistrationViewController
            else { fatalError("Cannot instantiate LoginPromptScreen") }
        loginSignInScreen.viewModel.sectionChosen = selectedSection
        return loginSignInScreen
    }
    
    private func instantiateModule(
        from storyboard: Storyboards,
        withID storyboardID: StoryboardID) -> UIViewController? {
        let storyboard = UIStoryboard(name: storyboard.rawValue,
                                      bundle: nil)
        return storyboard.instantiateViewController(
            withIdentifier: storyboardID.rawValue)
    }
}
