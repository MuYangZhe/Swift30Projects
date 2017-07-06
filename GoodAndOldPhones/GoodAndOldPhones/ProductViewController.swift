//
//  ProductViewController.swift
//  GoodAndOldPhones
//
//  Created by 牧易 on 17/7/5.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var phoneImageIV: UIImageView!
    
    var product:Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = product?.content
        if let imageName = product?.imageName {
            phoneImageIV.image = UIImage(named: imageName);
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addCart(_ sender: UIButton) {
        NSLog("add cart")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
