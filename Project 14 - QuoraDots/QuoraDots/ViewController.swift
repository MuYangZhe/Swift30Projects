//
//  ViewController.swift
//  QuoraDots
//
//  Created by 牧易 on 17/7/27.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let duration:Double = 0.6
    
    @IBOutlet weak var dotOne: UIImageView!
    @IBOutlet weak var dotTwo: UIImageView!
    @IBOutlet weak var dotThree: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startAnimation()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    func startAnimation() -> Void {
        dotOne.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        dotTwo.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        dotThree.transform = CGAffineTransform.init(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: duration, delay: 0.2, options: [.repeat, .autoreverse], animations: {
            self.dotOne.transform = CGAffineTransform.identity
        }, completion: nil)
        
        UIView.animate(withDuration: duration, delay: 0.4, options: [.repeat, .autoreverse], animations: {
            self.dotTwo.transform = CGAffineTransform.identity
        }, completion: nil)
        UIView.animate(withDuration: duration, delay: 0.6, options: [.repeat, .autoreverse], animations: {
            self.dotThree.transform = CGAffineTransform.identity
        }, completion: nil)
    }

}

