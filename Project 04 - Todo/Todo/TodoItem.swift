//
//  TodoItem.swift
//  Todo
//
//  Created by 牧易 on 17/7/11.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import Foundation

class TodoItem:NSObject {
    var id:String
    var title:String
    var date:Date
    var image:String
    
    init(id: String, image: String, title: String, date: Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
    
}
