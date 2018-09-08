//
//  PilaTextField.swift
//  Pila
//
//  Created by Julia Nikitina on 08/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

@IBDesignable
final class PilaTextField: UITextField {
    
    @IBInspectable
    var placeholderColor: UIColor = .gray {
        didSet {
            setUpPlaceholder()
        }
    }
    
    @IBInspectable
    var placeholderSize: CGFloat = 20 {
        didSet {
            setUpPlaceholder()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setUpViews()
    }
    
    private func setUpPlaceholder() {
        guard let placeholder = placeholder else { return }
        
        let attributed = NSAttributedString(string: placeholder, attributes: [.foregroundColor: placeholderColor, .font: Fonts.latoRegular(size: placeholderSize)])
        
        attributedPlaceholder = attributed
    }
    
    private func setUpViews() {
         setUpPlaceholder()
    }

}
