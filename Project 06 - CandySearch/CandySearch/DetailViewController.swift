//
//  DetailViewController.swift
//  CandySearch
//
//  Created by 牧易 on 17/7/17.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var candyImageView: UIImageView!

    var candy:Candy?
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
        
    }
    
    func configView(){
        if let candy = candy{
            titleLabel.text = candy.name
            candyImageView.image = UIImage.init(named: candy.name)
            self.title = candy.category
        }
    }
    

    

}
