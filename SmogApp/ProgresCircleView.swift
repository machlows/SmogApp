//
//  ProgresCircleView.swift
//  SmogApp
//
//  Created by Tomasz Machlowski on 26/09/2017.
//  Copyright © 2017 Tomasz Machlowski. All rights reserved.
//

import Foundation
import UIKit

class ProgresCircleView: UIView {
    @IBInspectable var mainColor: UIColor!
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
    }

    func drawCircle(center: CGPoint, radius: CGFloat, percentage: CGFloat) {
        let circlePath = UIBezierPath(arcCenter: center, radius: radius, startAngle: CGFloat(0), endAngle:CGFloat(Double.pi * 2) * percentage , clockwise: true)
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circlePath.cgPath
        
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeColor = mainColor.cgColor
        shapeLayer.lineWidth = 4.0
        
        self.layer.addSublayer(shapeLayer)
    }
    
    func clearView() {
        self.layer.sublayers?.forEach { $0.removeFromSuperlayer() }
    }

}
