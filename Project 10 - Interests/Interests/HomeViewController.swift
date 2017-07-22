//
//  HomeViewController.swift
//  Interests
//
//  Created by 牧易 on 17/7/22.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet weak var backgruandImageView: UIImageView!
    @IBOutlet weak var horizontalCollectionView: UICollectionView!
    
    fileprivate let interests = Interest.createInterests()
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    

   

}

extension HomeViewController:UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        guard let interests = interests else {
//            return 0
//        }
        return interests.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "InterestCell"
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! InterestCell
        
        cell.configData(interests[indexPath.row])
        
        
        return cell
    }
}

extension HomeViewController:UIScrollViewDelegate {
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let layout = self.horizontalCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        let cellWidthWithSpace = layout.itemSize.width + layout.minimumLineSpacing
        
        var offset = targetContentOffset.pointee
        
        let index = (offset.x + scrollView.contentInset.left) / cellWidthWithSpace
        let roundedIndex = round(index)
        
        offset = CGPoint(x: roundedIndex * cellWidthWithSpace - scrollView.contentInset.left, y: -scrollView.contentInset.top)
    }
}

