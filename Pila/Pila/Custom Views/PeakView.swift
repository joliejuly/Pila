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
        
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 0, y: 25))
        bezierPath.addCurve(to: CGPoint(x: 9.38, y: 3.82), controlPoint1: CGPoint(x: 1.52, y: 24.75), controlPoint2: CGPoint(x: 6.06, y: 11.88))
        bezierPath.addCurve(to: CGPoint(x: 12.63, y: 0), controlPoint1: CGPoint(x: 10.57, y: 0.94), controlPoint2: CGPoint(x: 11.55, y: -0.01))
        bezierPath.addCurve(to: CGPoint(x: 15.91, y: 3.71), controlPoint1: CGPoint(x: 13.7, y: 0.01), controlPoint2: CGPoint(x: 14.86, y: 0.98))
        bezierPath.addCurve(to: CGPoint(x: 25, y: 25), controlPoint1: CGPoint(x: 20.96, y: 16.83), controlPoint2: CGPoint(x: 21.72, y: 22.77))
        UIColor.white.setFill()
        bezierPath.fill()


    }
 

}
