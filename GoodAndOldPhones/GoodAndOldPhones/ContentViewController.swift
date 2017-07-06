//
//  ContentViewController.swift
//  GoodAndOldPhones
//
//  Created by 牧易 on 17/7/5.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController {

    @IBOutlet var scrollView: UIScrollView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.contentSize =  CGSize(width: 375, height: 800)
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
