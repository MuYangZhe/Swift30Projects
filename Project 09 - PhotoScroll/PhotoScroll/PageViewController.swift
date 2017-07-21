//
//  PageViewController.swift
//  PhotoScroll
//
//  Created by 牧易 on 17/7/20.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {

    var photos = ["photo1", "photo2", "photo3", "photo4", "photo5"]
    var currentIndex:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dataSource = self
        
        if let viewController = photoCommonViewController(currentIndex ?? 0 ){
            let viewControllers = [viewController]
            setViewControllers(viewControllers, direction: .forward, animated: false, completion: nil)
        }
    }

    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func photoCommonViewController(_ index:Int) -> PhotoCommenViewController? {
        
        
        
        if let storyboard = storyboard ,
            let page = storyboard.instantiateViewController(withIdentifier: "PhotoCommenViewController") as? PhotoCommenViewController {
            page.imageName = photos[index]
            page.photoIndex = index
            return page
        }
        return nil
    }
    
    
    
    

}

extension PageViewController:UIPageViewControllerDataSource{
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PhotoCommenViewController {
            guard let index = viewController.photoIndex , index != 0 else {
                return nil
            }
            return photoCommonViewController(index - 1);
        }
        return nil
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        if let viewController = viewController as? PhotoCommenViewController {
            guard let index = viewController.photoIndex , index+1 < photos.count else {
                return nil
            }
             return photoCommonViewController(index + 1);
        }
        return nil
        
        
       
        
        
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return photos.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return  currentIndex ?? 0
    }
}

