//
//  PhotosCollectionViewController.swift
//  PhotoScroll
//
//  Created by 牧易 on 17/7/19.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

fileprivate let thumbnailSize:CGFloat = 70.0
fileprivate let  reuseIdentifier = "PhotoCell"
fileprivate let sectionInsets = UIEdgeInsets(top: 10, left: 5.0, bottom: 10.0, right: 5.0)

class PhotosCollectionViewController: UICollectionViewController {
    
    let photos = ["photo1","photo2","photo3","photo4","photo5"]

    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.title = "Photo Scroll"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let cell = sender as? UICollectionViewCell,
            let indexPath = collectionView?.indexPath(for: cell),
            let pageViewController = segue.destination as? PageViewController {
            pageViewController.photos = photos
            pageViewController.currentIndex = indexPath.row
        }
    }
    

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! PhotoCell
        let image = UIImage.init(named: photos[indexPath.row])
        cell.photoView.image = image?.thumbnailOfSize(thumbnailSize)
        
    
        return cell
    }
    
    // MARK:UICollectionViewDelegateFlowLayout
    
    

}


extension PhotoCommenViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: thumbnailSize, height: thumbnailSize)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}
