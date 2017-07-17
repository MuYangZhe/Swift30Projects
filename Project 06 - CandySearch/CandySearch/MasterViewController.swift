//
//  MasterViewController.swift
//  CandySearch
//
//  Created by 牧易 on 17/7/14.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    var candies:[Candy] = []
    var filteredCandies:[Candy] = []
    
    
    
    let searchController = UISearchController.init(searchResultsController: nil)

    override func viewDidLoad() {
        super.viewDidLoad()
        candies = [ Candy(category:"Chocolate", name:"Chocolate Bar"),
        Candy(category:"Chocolate", name:"Chocolate Chip"),
        Candy(category:"Chocolate", name:"Dark Chocolate"),
        Candy(category:"Hard", name:"Lollipop"),
        Candy(category:"Hard", name:"Candy Cane"),
        Candy(category:"Hard", name:"Jaw Breaker"),
        Candy(category:"Other", name:"Caramel"),
        Candy(category:"Other", name:"Sour Chew"),
        Candy(category:"Other", name:"Gummi Bear")]
        
        filteredCandies = candies
        addSearch()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func addSearch(){
        
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All", "Chocolate", "Hard", "Other"]
        searchController.searchBar.delegate = self
    }

    func filterContentForSearchText(searchText:String,scope:String = "All"){
        filteredCandies = candies.filter({ (candy) -> Bool in
            if(scope != "All" && candy.category != scope){
                return false
            }
            return candy.name.lowercased().contains(searchText.lowercased()) || searchText.isEmpty
        })
        tableView.reloadData()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let detailCany = filteredCandies[indexPath.row]
                
                let controller = ( segue.destination as! UINavigationController ).topViewController as! DetailViewController
                controller.candy = detailCany
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
            
        }
    }
    
    
    
    // mark: tableview
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredCandies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let nameLabel = cell.viewWithTag(11) as! UILabel
        let categoryLabel = cell.viewWithTag(12) as! UILabel
        
        let candy = filteredCandies[indexPath.row]
        nameLabel.text = candy.name
        categoryLabel.text = candy.category
        
        return cell
    }

}




extension MasterViewController: UISearchResultsUpdating{
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar
        let scope = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex]
        
        filterContentForSearchText(searchText: searchBar.text! ,scope: scope!)
       
    }
}


extension MasterViewController:UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        let scope = searchBar.scopeButtonTitles?[selectedScope]
        filterContentForSearchText(searchText: searchBar.text! , scope:scope!)
    }
}
