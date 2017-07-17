//
//  ArtistListViewController.swift
//  Artistry
//
//  Created by 牧易 on 17/7/13.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class ArtistListViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!

    let artistList = Artist.getArtistsFromRes()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 140
        
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showWorks" {
            if let cell = sender as? UITableViewCell ,
                let indexPath = tableView.indexPath(for: cell) ,
                let workVC = segue.destination as? WorksListViewController {
                    let artist = artistList[indexPath.row]
                    workVC.artistName = artist.name
                    workVC.works = artist.works
            }
        }
    }

}

extension ArtistListViewController :UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return artistList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "artistCell", for: indexPath) as! ArtistTableViewCell
        let artist = artistList[indexPath.row]
        cell.photoImageView.image = artist.image
        cell.nameLabel.text = artist.name
        cell.bioLabel.text = artist.bio
        
        return cell
    }
}
