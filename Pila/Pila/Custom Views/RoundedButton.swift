//
//  RoundedButton.swift
//  Pila
//
//  Created by Julia Nikitina on 05/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

@IBDesignable
final class RoundedButton: UIButton {

    @IBInspectable
    private var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable
    private var borderColor: UIColor = .clear {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }

    override func setTitle(_ title: String?, for state: UIControl.State) {
        
       
    }
    
    override func prepareForInterfaceBuilder() {
        setUpView()
    }
    
    override func awakeFromNib() {
        setUpView()
    }

    private func setUpView() {
        layer.cornerRadius = frame.height / 2
        
        guard let textForTitle = title(for: .normal) else { return }
        
        let attrTitle = NSAttributedString(string: textForTitle, attributes: [.font: Fonts.latoBold(size: 20)])
        
        setAttributedTitle(attrTitle, for: .normal)
        
    }
}
