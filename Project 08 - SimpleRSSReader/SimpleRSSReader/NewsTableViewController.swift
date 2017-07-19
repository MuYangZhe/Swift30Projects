//
//  NewsTableViewController.swift
//  SimpleRSSReader
//
//  Created by 牧易 on 17/7/18.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class NewsTableViewController: UITableViewController {
    fileprivate let parserUtil = ParserUtil()
    let dataUrl = "http://www.apple.com/main/rss/hotnews/hotnews.rss"
    var items:[Item]?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.estimatedRowHeight = 140
        tableView.rowHeight = UITableViewAutomaticDimension
        
        parserUtil.startParser(xmlUrl: dataUrl) { [weak self] items in
            self?.items = items
            DispatchQueue.main.async {
                self?.tableView.reloadSections(IndexSet.init(integer: 0), with: .none)
            }
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let items = items else {
            return 0
        }
        
        return items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ItemTableViewCell
        if let item = items?[indexPath.row] {
            cell.titleLabel.text = item.title
            cell.dateLabel.text = item.date
            cell.descLabel.text = item.desc
        }
        
        
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! ItemTableViewCell
        tableView.beginUpdates()
        cell.isShowAllDesc = !cell.isShowAllDesc
        tableView.endUpdates()
        
    }
    
}
