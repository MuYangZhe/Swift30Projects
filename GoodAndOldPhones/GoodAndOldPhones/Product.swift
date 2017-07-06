//
//  Product.swift
//  GoodAndOldPhones
//
//  Created by 杨芳 on 17/7/5.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

struct Product  {
    let content:String?
    let cellImageName:String?
    let imageName:String?
    
    init(content:String,cellImageName:String,imageName:String) {
        self.content = content
        self.cellImageName = cellImageName
        self.imageName = imageName
    }

}
