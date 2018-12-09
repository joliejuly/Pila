//
//  UIApplication.swift
//  Pila
//
//  Created by Julia Nikitina on 10/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

extension UIApplication {
    var statusBarView: UIView? {
        return value(forKey: "statusBar") as? UIView
    }
}
