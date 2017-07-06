//
//  ProductTableViewController.swift
//  GoodAndOldPhones
//
//  Created by 杨芳 on 17/7/5.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class ProductTableViewController: UITableViewController {
    
    private var products:[Product]?

    override func viewDidLoad() {
        super.viewDidLoad()
        products = [Product.init(content: "1907 Wall Set", cellImageName: "image-cell1", imageName: "phone-fullscreen1"),
                    Product.init(content: "1921 Dial Phone", cellImageName: "image-cell2", imageName: "phone-fullscreen2"),
                    Product.init(content: "1937 Desk Set", cellImageName: "image-cell3", imageName: "phone-fullscreen3"),
                    Product.init(content: "1984 Moto Portable", cellImageName: "image-cell4", imageName: "phone-fullscreen4")]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if let products = products{
            return products.count
        }
        
        return 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        let product = products?[indexPath.row]
        
        cell.textLabel?.text = product?.cellImageName
        if let imageName = product?.cellImageName {
            cell.imageView?.image = UIImage(named: imageName)
        }

        return cell
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let cell = sender as? UITableViewCell,
                let index = tableView.indexPath(for: cell),
                let productVC = segue.destination as? ProductViewController
            {
                productVC.product = products?[index.row];
            }
          
        }
        
    }
    

}
