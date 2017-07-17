//
//  WorkTableViewCell.swift
//  Artistry
//
//  Created by 牧易 on 17/7/13.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class WorkTableViewCell: UITableViewCell {
    @IBOutlet weak var workImageView: UIImageView!
   
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var workInfoLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
