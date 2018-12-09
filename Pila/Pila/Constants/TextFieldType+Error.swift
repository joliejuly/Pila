//
//  TextFieldType+Error.swift
//  Pila
//
//  Created by Yulia Taranova on 09/12/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import Foundation
enum TextFieldType: String {
    case email = "Email"
    case password = "Password"
    case firstName = "First name"
    case lastName = "Last name"
}

enum TextFieldInputError: String {
    case email = "Something is wrong with your email input"
    case weakPassword = "Password is too weak"
    case notSafePassword = "It's recommended that you add digits and uppercase letters to your password"
    case names = "Please, enter only latin characters"
}
