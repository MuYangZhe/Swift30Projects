//
//  WorksListViewController.swift
//  Artistry
//
//  Created by 牧易 on 17/7/13.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class WorksListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var artistName:String?
    var works:[Work] = []
    let moreInfoText = "Select For More Info >"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 300
        
        self.title = artistName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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


extension WorksListViewController :UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return works.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "workCell", for: indexPath) as! WorkTableViewCell
        let work = works[indexPath.row]
        cell.workImageView.image = work.image
        
        cell.nameLabel.text = work.title
        
        cell.workInfoLabel.text = work.isExpanded ? work.info : moreInfoText
        cell.workInfoLabel.textAlignment = work.isExpanded ? .left : .center
        
        
        return cell
        
        
    }
    
    
    
    
}


extension WorksListViewController :UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? WorkTableViewCell else {
            return
        }
        
        var work = works[indexPath.row]
        work.isExpanded = !work.isExpanded
        works[indexPath.row] = work
        
        
        cell.workInfoLabel.text = work.isExpanded ? work.info : moreInfoText
        cell.workInfoLabel.textAlignment = work.isExpanded ? .left : .center
        
        tableView.beginUpdates()
        tableView.endUpdates()
        
        tableView.scrollToRow(at: indexPath, at: .top, animated: true)
        
    }
}
