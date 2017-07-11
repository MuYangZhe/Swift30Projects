//
//  Util.swift
//  Todo
//
//  Created by 牧易 on 17/7/11.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import Foundation


func dateToString(_ date:Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.string(from: date)
}

func stringToDate(_ date:String) -> Date?{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "yyyy-MM-dd"
    return dateFormatter.date(from: date)
}

