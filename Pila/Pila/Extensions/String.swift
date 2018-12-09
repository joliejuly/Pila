//
//  String.swift
//  Pila
//
//  Created by Julia Nikitina on 09/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import Foundation

extension String {
    
    //checking first and last name
    public var latinCharactersOnly: Bool {
        return self.range(of: "\\P{Latin}", options: .regularExpression) == nil
    }

    //checking email format
    private static let firstpart = "[A-Z0-9a-z]([A-Z0-9a-z._%+-]{0,30}[A-Z0-9a-z])?"
    private static let serverpart = "([A-Z0-9a-z]([A-Z0-9a-z-]{0,30}[A-Z0-9a-z])?\\.){1,5}"
    private static let emailRegex = firstpart + "@" + serverpart + "[A-Za-z]{2,6}"
    
    public var isEmail: Bool {
        let predicate = NSPredicate(format: "SELF MATCHES %@", type(of:self).emailRegex)
        return predicate.evaluate(with: self)
    }
    
    //checking password
    //we use float to display it later in UIProgress indicator that uses Float from 0.0 to 1.0
    public var strengthOfPassword: Float {
        let numberOfCharacters = self.count
        
        switch numberOfCharacters {
        case 0...6: return 0.2
        default:
            
            for character in self {
                guard let scalarCharacter = character.unicodeScalars.first else { return 0.6 }
                
                if CharacterSet.uppercaseLetters.contains(scalarCharacter) {
                    return 0.8
                }
                
                if CharacterSet(charactersIn: "0123456789").contains(scalarCharacter) {
                    return 0.8
                }
                
                if CharacterSet.punctuationCharacters.contains(scalarCharacter) {
                    return 0.8
                }
            }
        
            return 0.6
        }
    }
    
    
    
}
