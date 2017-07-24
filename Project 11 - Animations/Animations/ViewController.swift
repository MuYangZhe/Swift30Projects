//
//  ViewController.swift
//  Animations
//
//  Created by 牧易 on 17/7/23.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

let headerHight:CGFloat = 50.0
let duration = 1.5

class ViewController: UIViewController {

    @IBOutlet weak var masterTableView: UITableView!
    
    // MARK: - Variables
    fileprivate let items = ["2-Color", "Simple 2D Rotation", "Multicolor", "Multi Point Position", "BezierCurve Position","Color and Frame Change", "View Fade In", "Pop"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    
    override func viewWillAppear(_ animated: Bool) {
        animateTable()
    }

    
    func animateTable(){
        masterTableView.reloadData()
        
        let cells = masterTableView.visibleCells
        let tableHeight = masterTableView.bounds.size.height
        
        //move all cell to the bottom of the screen 
        
        for cell in cells {
            cell.transform = CGAffineTransform(translationX: 0, y: tableHeight)
        }
        
         // move all cells from bottom to the right place
        var index = 0
        for cell in cells {
            UIView.animate(withDuration: duration, delay: Double(index) * 0.05, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: [], animations: {
                cell.transform = CGAffineTransform(translationX: 0, y: 0)
            }, completion: nil)
            index += 1
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" ,
            let detailVC = segue.destination as? DetailViewController ,
            let index = masterTableView.indexPathForSelectedRow {
            
            detailVC.animationTitle = items[index.row]
            
            
        }
    }

}

extension ViewController:UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "itemCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        
        cell.textLabel?.text = items[indexPath.row]
        
        return cell
    }
}


extension ViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHight
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Basic Animations"
    }
}

