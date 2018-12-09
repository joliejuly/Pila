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
    
    @IBInspectable
    private var fontSize: CGFloat = 20 {
        didSet {
            setUpView()
        }
    }
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled == false {
                alpha = 0.5
            } else {
                alpha = 1
            }
        }
    }
    
    override func prepareForInterfaceBuilder() {
        setUpView()
    }
    
    override func awakeFromNib() {
        setUpView()
    }

    private func setUpView() {
        layer.cornerRadius = frame.height / 2
        guard
            let textForTitle = title(for: .normal),
            let titleColor = titleColor(for: .normal)
        else { return }
        let attrTitle = NSAttributedString(string: textForTitle,
                                           attributes: [
                                            .font: UIFont.latoBold(size: fontSize),
                                            .foregroundColor: titleColor
                                            ])
        setAttributedTitle(attrTitle, for: .normal)
    }
}
