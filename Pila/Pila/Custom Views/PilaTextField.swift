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
    
    @IBInspectable
    var bottomBorderColor: UIColor = .gray {
        didSet {
            updateBottomBorder()
        }
    }

    private var bottomBorderHeight: CGFloat = 1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpViews()
    }
    
    override func prepareForInterfaceBuilder() {
        setUpViews()
        updateViews()
    }
    
    private func setUpViews() {
        borderStyle = .none
        
        font = Fonts.latoBold(size: 20)
        textColor = .black
        
        addBottomBorder()
    }
    
    private func updateViews() {
        setUpPlaceholder()
    }
    
    private func setUpPlaceholder() {
        guard let placeholder = placeholder else { return }
        
        let attributed = NSAttributedString(string: placeholder, attributes: [.foregroundColor: placeholderColor, .font: Fonts.latoRegular(size: placeholderSize)])
        
        attributedPlaceholder = attributed
    }
   
    private func updateBottomBorder() {
        viewWithTag(1)?.backgroundColor = bottomBorderColor
    }
    
    private func addBottomBorder() {
        let borderView = UIView()
        
        borderView.backgroundColor = #colorLiteral(red: 0.8630058169, green: 0.9392105937, blue: 0.9747415185, alpha: 1)
        borderView.tag = 1
        
        addSubview(borderView)
        
        borderView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            borderView.heightAnchor.constraint(equalToConstant: bottomBorderHeight),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            borderView.topAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
