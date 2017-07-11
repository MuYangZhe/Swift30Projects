//
//  TodoListTableViewController.swift
//  Todo
//
//  Created by 牧易 on 17/7/11.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

var todos:[TodoItem] = []

class TodoListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.leftBarButtonItem = editButtonItem
        todos = [TodoItem(id: "1", image: "child-selected", title: "Go to Disney", date: stringToDate("2014-10-20")!),
                 TodoItem(id: "2",  image:"phone-selected", title: "Cicso Shopping",date: stringToDate("2014-10-28")!),
                 TodoItem(id: "3", image:"shopping-cart-selected", title: "Phone to Jobs",date: stringToDate("2014-10-30")!),
                 TodoItem(id: "4", image: "travel-selected", title: "Plan to Europe", date: stringToDate("2014-10-31")!)]
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "show" {
            let vc = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow
            if let indexPath = indexPath {
                vc.todoItem = todos[(indexPath as NSIndexPath).row]
            }
        }
    }

    
    
    
    
    
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath)
        let item = todos[indexPath.row]
        
        let imageView = cell.viewWithTag(11) as! UIImageView
        let titleLabel = cell.viewWithTag(12) as! UILabel
        let dateLabel = cell.viewWithTag(13) as! UILabel
        imageView.image = UIImage(named: item.image)
        titleLabel.text = item.title
        dateLabel.text = dateToString(item.date)
        
        
        return cell
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        self.tableView.setEditing(editing, animated: animated)
    }
    
    // MARK: - Table view delegate
    
    // delete
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            todos.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        }
    }
    
    // move
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let item = todos.remove(at: sourceIndexPath.row)
        todos.insert(item, at: destinationIndexPath.row)
    }

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
