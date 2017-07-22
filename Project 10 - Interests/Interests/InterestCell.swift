//
//  InterestCell.swift
//  Interests
//
//  Created by 牧易 on 17/7/22.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class InterestCell: UICollectionViewCell {
    
    @IBOutlet weak var featuredImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    func configData(_ insterest:Interest){
//        guard let insterest = insterest else {
//            return
//        }
        titleLabel.text = insterest.title
        featuredImageView.image = insterest.featuredImage
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 8.0
        self.clipsToBounds = true
    }
}
