//
//  MainViewController.swift
//  Tumblr
//
//  Created by 牧易 on 17/7/26.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    let transitionManager = TransitionManager()
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.toolbar.clipsToBounds = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func unwindToMainViewController (_ sender: UIStoryboardSegue){
        dismiss(animated: true, completion: nil)
    }
    

}
