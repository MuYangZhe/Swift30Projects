//
//  Common.swift
//  Animations
//
//  Created by 牧易 on 17/7/24.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import Foundation
import UIKit

let screenRect = UIScreen.main.bounds
let generalFrame = CGRect(x: 0, y: 0, width: screenRect.width/2, height: screenRect.height/4)
let generalCenter = CGPoint(x: screenRect.midX, y: screenRect.midY - 50)


func drawSquare(color:UIColor,center:CGPoint,frame:CGRect) ->UIView {
    let square = UIView(frame: frame)
    square.center = center
    square.backgroundColor = color
    
    return square
}

func drawCircleView(color:UIColor,center:CGPoint,radiaus:CGFloat) -> UIView {
    let circlePath = UIBezierPath(arcCenter: center, radius: radiaus, startAngle: CGFloat(0), endAngle: CGFloat(M_PI * 2), clockwise: true)
    
    let shapeLayer = CAShapeLayer()
    shapeLayer.path = circlePath.cgPath
    shapeLayer.fillColor = color.cgColor
    shapeLayer.strokeColor = color.cgColor
    shapeLayer.lineWidth = 3.0
    
    let view = UIView()
    view.layer.addSublayer(shapeLayer)
    
    return view
}
