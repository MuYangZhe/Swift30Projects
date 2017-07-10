//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by 牧易 on 17/7/7.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class Stopwatch : NSObject {
    var counter:Double
    var timer:Timer
    
    override init() {
        counter = 0.0
        self.timer = Timer()
    }
    
    
    func showTime() -> String {
        
        let seconds = counter.truncatingRemainder(dividingBy: 60)//String(format: "%.2f", counter.truncatingRemainder(dividingBy: 60))
        let min:Int = Int(counter/60)
        var minStr  =  String(min)
        var secStr = String(format: "%.2f", seconds)
        if(min < 10){
            minStr = "0" + minStr
        }
        
        if(seconds < 10){
            secStr = "0" + secStr
        }
        
        return minStr + ":" + secStr
        
    }
}
