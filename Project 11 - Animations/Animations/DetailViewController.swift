//
//  DetailViewController.swift
//  Animations
//
//  Created by 牧易 on 17/7/24.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    var animationTitle = ""
    var animationView:UIView!
    
    fileprivate let duration = 2.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        
    }

    func initUI(){
        title = animationTitle
        
        if animationTitle == "BezierCurve Position" {
            animationView = drawCircleView(color: UIColor.red, center: CGPoint(x:100,y:screenRect.midY-50), radiaus: 20)
            
        }else if animationTitle == "View Fade In"{
            animationView = UIImageView(image: UIImage.init(named: "whatsapp"))
            animationView.frame = generalFrame
            animationView.center = generalCenter
        }
        else {
            animationView = drawSquare(color: UIColor.red, center: generalCenter, frame: generalFrame)
        }
        self.view.addSubview(animationView!)
    }
    
    @IBAction func startAnimate(_ sender: UIButton) {
        switch animationTitle {
        case "2-Color":
            changeColor(color: UIColor.green)
        case "Simple 2D Rotation":
            rotation(CGFloat(M_PI))
        case "Multicolor":
            multiColor(UIColor.green,secondColor: UIColor.blue)
        case "Multi Point Position":
            let firstPoint = CGPoint(x: animationView.frame.origin.x, y: screenRect.midY + 100)
            let secondPoint = CGPoint(x: animationView.frame.origin.x, y: screenRect.midY - 200)
            multiPosition(firstPoint: firstPoint, secondPoint: secondPoint)
            
        case "BezierCurve Position":
            var controlPoint1 = self.animationView.center
            controlPoint1.y -= 125.0
            var controlPoint2 = controlPoint1
            controlPoint2.x += 40.0
            controlPoint2.y -= 125.0;
            var endPoint = self.animationView.center;
            endPoint.x += 75.0
            curvePath(endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        case "Color and Frame Change":
            let currentFrame = self.animationView.frame
            let firstFrame = currentFrame.insetBy(dx: -30, dy: -50)
            let secondFrame = firstFrame.insetBy(dx: 10, dy: 15)
            let thirdFrame = secondFrame.insetBy(dx: -15, dy: -20)
            colorAndFrameChange(firstFrame, secondFrame, thirdFrame, UIColor.orange, UIColor.yellow, UIColor.green)
        case "Pop":
            Pop()
        case "View Fade In":
            viewFadeIn()
            
        default:
            break
            
        }
    }
    
    
    func changeColor(color:UIColor){
        UIView.animate(withDuration: self.duration) { 
            self.animationView.backgroundColor = color
        }
    }
    
    func rotation(_ angel:CGFloat){
        UIView.animate(withDuration: self.duration, delay: 0.2, options: [.repeat], animations: { 
            self.animationView.transform = CGAffineTransform(rotationAngle: angel)
        }, completion: nil)
    }
    
    func multiColor(_ firstColor:UIColor , secondColor:UIColor)  {
        UIView.animate(withDuration: self.duration, delay: 0, options: [], animations: {
            self.animationView.backgroundColor = firstColor
        }) { (finished) in
            self.changeColor(color: secondColor)
        }
    }

    func multiPosition(firstPoint:CGPoint,secondPoint:CGPoint) -> Void {
        UIView.animate(withDuration: self.duration, animations: { 
            self.animationView.frame.origin = firstPoint
        }) { (finished) in
            self.simplePosition(secondPoint)
        }
    }
    
    func simplePosition(_ point:CGPoint) {
        UIView.animate(withDuration: self.duration) { 
            self.animationView.frame.origin = point
        }
    }

    func curvePath(_ endPoint:CGPoint,controlPoint1:CGPoint,controlPoint2:CGPoint){
        let path = UIBezierPath()
        
        path.move(to: animationView.center)
        
        path.addCurve(to: endPoint, controlPoint1: controlPoint1, controlPoint2: controlPoint2)
        
        // create a new CAKeyframeAnimation that animates the objects position
        let anim = CAKeyframeAnimation(keyPath: "position")
        // set the animations path to our bezier curve
        anim.path = path.cgPath
        
        // set some more parameters for the animation
        anim.duration = self.duration
        
        // add the animation to the squares 'layer' property
        self.animationView.layer.add(anim, forKey: "animate position along path")
        self.animationView.center = endPoint
        
    }
    
    func colorAndFrameChange(_ firstFrame: CGRect, _ secondFrame: CGRect, _ thirdFrame: CGRect,
                             _ firstColor: UIColor, _ secondColor: UIColor, _ thirdColor: UIColor){
        UIView.animate(withDuration: self.duration, animations: { 
            self.animationView.frame = firstFrame
            self.animationView.backgroundColor = firstColor
        }) { (finished) in
            UIView.animate(withDuration: self.duration, animations: { 
                self.animationView.frame = secondFrame
                self.animationView.backgroundColor = secondColor
            }, completion: { (finished) in
                UIView.animate(withDuration: self.duration, animations: { 
                    self.animationView.frame = thirdFrame
                    self.animationView.backgroundColor = thirdColor
                })
            })
        }
    }
    
    func Pop(){
        UIView.animate(withDuration: self.duration/4, animations: {
            self.animationView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }) { (finished) in
            UIView.animate(withDuration: self.duration/4, animations: { 
                self.animationView.transform = CGAffineTransform.identity
            })
        }
    }
    
    func viewFadeIn(){
        let secondView = UIImageView(image: UIImage(named: "facebook"))
        secondView.frame = self.animationView.frame
        secondView.center = self.animationView.center
        secondView.alpha = 0.0
        
        view.insertSubview(secondView, aboveSubview: self.animationView)
        
        
        UIView.animate(withDuration: self.duration, delay: 0.2 , options: .curveEaseOut, animations: {
            self.animationView.alpha = 0.0
            secondView.alpha = 1.0
        }, completion: nil )
        
    }
    

}
