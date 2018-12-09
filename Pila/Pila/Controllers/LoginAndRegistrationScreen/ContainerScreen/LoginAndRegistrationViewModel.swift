//
//  LoginAndRegistrationViewModel.swift
//  Pila
//
//  Created by Julia Nikitina on 06/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

final class LoginAndRegistrationViewModel {
    
    var userDidChooseSection: ((SectionChosen) -> Void)?
    var sectionChosen: SectionChosen = .login {
        didSet {
            userDidChooseSection?(sectionChosen)
        }
    }
}

enum SectionChosen {
    case login
    case signin
}
