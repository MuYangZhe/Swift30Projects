//
//  ItemTableViewCell.swift
//  SimpleRSSReader
//
//  Created by 牧易 on 17/7/18.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!{
        didSet {
            descLabel.numberOfLines = 4
        }
    }
    
    var isShowAllDesc = false {
        didSet{
            if(isShowAllDesc) {
                descLabel.numberOfLines = 0
            }else{
                descLabel.numberOfLines = 4
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
