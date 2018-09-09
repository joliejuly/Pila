//
//  NibloadableProtocol.swift
//  Pila
//
//  Created by Julia Nikitina on 09/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

public protocol Nibloadable {
    static var nibName: String { get }
}

public extension Nibloadable where Self: UIView {
    
    public static var nibName: String {
        return String(describing: Self.self) // defaults to the name of the class implementing this protocol.
    }
    
    public static var nib: UINib {
        let bundle = Bundle(for: Self.self)
        return UINib(nibName: Self.nibName, bundle: bundle)
    }
    
    func setupFromNib() {
        guard let view = Self.nib.instantiate(withOwner: self, options: nil).first as? UIView else { fatalError("Error loading \(self) from nib") }
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            view.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            view.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            view.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(constraints)
        
    }
}
