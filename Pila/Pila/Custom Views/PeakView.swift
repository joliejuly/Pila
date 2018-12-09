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
    //generated via PaintCode, do not edit
    override func draw(_ rect: CGRect) {
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 4, y: 25))
        bezierPath.addCurve(to: CGPoint(x: 10.13, y: 14.84),
                            controlPoint1: CGPoint(x: 5.15, y: 24.88),
                            controlPoint2: CGPoint(x: 7.61, y: 18.7))
        bezierPath.addCurve(to: CGPoint(x: 12.6, y: 13),
                            controlPoint1: CGPoint(x: 11.03, y: 13.45),
                            controlPoint2: CGPoint(x: 11.78, y: 12.99))
        bezierPath.addCurve(to: CGPoint(x: 15, y: 15),
                            controlPoint1: CGPoint(x: 13.41, y: 13.01),
                            controlPoint2: CGPoint(x: 14.2, y: 13.69))
        bezierPath.addCurve(to: CGPoint(x: 21, y: 25),
                            controlPoint1: CGPoint(x: 16.12, y: 16.83),
                            controlPoint2: CGPoint(x: 19.23, y: 24.24))
        UIColor.white.setFill()
        bezierPath.fill()
    }
}
