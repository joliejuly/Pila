//
//  PeakView.swift
//  Pila
//
//  Created by Julia Nikitina on 15/09/2018.
//  Copyright © 2018 Julia Nikitina. All rights reserved.
//

import UIKit

@IBDesignable
final class PeakView: UIView {

    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 100))
        bezierPath.addCurve(to: CGPoint(x: 35.65, y: 17.83), controlPoint1: CGPoint(x: 5.76, y: 99.04), controlPoint2: CGPoint(x: 23.03, y: 49.1))
        bezierPath.addCurve(to: CGPoint(x: 47.98, y: 3), controlPoint1: CGPoint(x: 40.17, y: 6.63), controlPoint2: CGPoint(x: 43.9, y: 2.95))
        bezierPath.addCurve(to: CGPoint(x: 60.45, y: 17.41), controlPoint1: CGPoint(x: 52.05, y: 3.05), controlPoint2: CGPoint(x: 56.46, y: 6.81))
        bezierPath.addCurve(to: CGPoint(x: 95, y: 100), controlPoint1: CGPoint(x: 79.65, y: 68.31), controlPoint2: CGPoint(x: 82.53, y: 91.33))
        UIColor.white.setFill()
        bezierPath.fill()

    }
 

}
