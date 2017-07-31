//
//  MasterViewController.swift
//  SpotifySignln
//
//  Created by 牧易 on 17/7/31.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class MasterViewController: VideoSplashViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(fileURLWithPath: Bundle.main.path(forResource: "moments", ofType: "mp4")!)
        // Do any additional setup after loading the view.
        videoFrame = view.frame
        startTime = 2
        sound = true
        alpha = 0.8
        alwaysRepeat = true
        fillMode = .resizeAspectFill
        contentURL = url
        view.isUserInteractionEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
