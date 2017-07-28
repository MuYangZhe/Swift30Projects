//
//  ViewController.swift
//  SnpachatMenu
//
//  Created by 牧易 on 17/7/27.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    enum vcName:String {
        case chat = "ChatViewController"
        case discover = "DiscoverViewController"
        case stories = "StoriesViewController"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Create view controllers and add them to current view controller.
        let chatVC = UIViewController.init(nibName: vcName.chat.rawValue, bundle: nil)
        let discoverVC = UIViewController.init(nibName: vcName.chat.rawValue, bundle: nil)
        let storiesVC = UIViewController.init(nibName: vcName.stories.rawValue, bundle: nil)
        
        add(childViewController: chatVC, toParentViewController: self)
        add(childViewController: discoverVC, toParentViewController: self)
        add(childViewController: storiesVC, toParentViewController: self)
        
        //Set up current snap view.
        let snapView = UIImageView.init(image: UIImage(named:"Snap"))
        changeX(ofView: snapView, xPostion: view.frame.width)
        scrollView.addSubview(snapView)
        
        changeX(ofView: discoverVC.view, xPostion: view.frame.width * 2)
        changeX(ofView: storiesVC.view, xPostion: view.frame.width * 3)
        
        //Set up contentSize and contentOffset.
        scrollView.contentSize = CGSize(width: view.frame.width * 4, height: view.frame.height)
        scrollView.contentOffset.x = view.frame.width
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func changeX(ofView view:UIView,xPostion:CGFloat){
        var frame = view.frame
        frame.origin.x = xPostion
        view.frame = frame
    }
    
    fileprivate func add (childViewController:UIViewController,toParentViewController:UIViewController){
        addChildViewController(childViewController)
        scrollView.addSubview(childViewController.view)
        childViewController.didMove(toParentViewController: toParentViewController)
    }

}

