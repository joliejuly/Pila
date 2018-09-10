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
    
    var type: TextFieldType?
    
    private var bottomBorderHeight: CGFloat = 1
    private var bottomIndicatorBorderHeight: CGFloat = 3

    @IBInspectable
    var placeholderColor: UIColor = #colorLiteral(red: 0.1084083095, green: 0.5698664188, blue: 0.9313239455, alpha: 1) {
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
    
    @IBInspectable
    var bottomIndicatorBorderColor: UIColor = .clear {
        didSet {
            updateIndicatorBottomBorder()
        }
    }
    
    override var placeholder: String? {
        didSet {
            setUpPlaceholder()
        }
    }

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
        addBottomIndicatorBorder()
        setUpPlaceholder()
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
    
    private func updateIndicatorBottomBorder() {
        viewWithTag(2)?.backgroundColor = bottomIndicatorBorderColor
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
    
    private func addBottomIndicatorBorder() {
        let indicatorBorderView = UIView()
        
        //UIProgressView
        
        indicatorBorderView.backgroundColor = bottomIndicatorBorderColor
        indicatorBorderView.tag = 2
        
        guard let borderView = viewWithTag(1) else { return }
        
        addSubview(indicatorBorderView)
        
        indicatorBorderView.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            indicatorBorderView.heightAnchor.constraint(equalToConstant: bottomIndicatorBorderHeight),
            indicatorBorderView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor),
            indicatorBorderView.widthAnchor.constraint(equalTo: borderView.widthAnchor, constant: -120),
            indicatorBorderView.bottomAnchor.constraint(equalTo: borderView.topAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }

}
