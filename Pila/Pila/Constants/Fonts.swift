//
//  Constants.swift
//  Pila
//
//  Created by Julia Nikitina on 08/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

struct Fonts {
    
    static func latoRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Regular", size: size) ?? UIFont.systemFont(ofSize: size)
    }
    
    static func latoBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Lato-Bold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
    static func gilroy(size: CGFloat) -> UIFont {
        return UIFont(name: "Gilroy-ExtraBold", size: size) ?? UIFont.boldSystemFont(ofSize: size)
    }
    
}
