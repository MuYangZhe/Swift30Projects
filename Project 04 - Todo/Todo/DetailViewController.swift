//
//  DetailViewController.swift
//  Todo
//
//  Created by 牧易 on 17/7/11.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var childBtn: UIButton!
    @IBOutlet weak var phoneBtn: UIButton!
    @IBOutlet weak var shoppingBtn: UIButton!
    @IBOutlet weak var travelBtn: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var titleTF: UITextField!
    
    var todoItem:TodoItem?
    var imageName:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        
    }

    func initView(){
        if let item = todoItem {
            self.title = "Edit Todo"
            imageName = item.image
            if(imageName == "child-selected"){
                childBtn.isSelected = true
            }else if (imageName == "phone-selected"){
                phoneBtn.isSelected = true
            }else if (imageName == "shopping-cart-selected"){
                shoppingBtn.isSelected = true
            }else {
                travelBtn.isSelected = true
            }
            titleTF.text = item.title
            datePicker.date = item.date
            
        }else {
            self.title = "Add Todo"
            childBtn.isSelected = true
            imageName = "child-selected"
        }
    }
    
    @IBAction func selectChild(_ sender: UIButton) {
        setSelectButton(sender)
        imageName = "child-selected"
    }
    
    @IBAction func selectPhone(_ sender: UIButton) {
        setSelectButton(sender)
        imageName = "phone-selected"
    }
    
    @IBAction func selectShopping(_ sender: UIButton) {
        setSelectButton(sender)
        imageName = "shopping-cart-selected"
        
    }
    @IBAction func selectTravel(_ sender: UIButton) {
        setSelectButton(sender)
        imageName = "travel-selected"
        
    }

    func setSelectButton(_ button:UIButton){
        childBtn.isSelected = false
        phoneBtn.isSelected = false
        shoppingBtn.isSelected = false
        travelBtn.isSelected = false
        
        button.isSelected = true
    }
    
    
    @IBAction func tapDone(_ sender: Any) {
        if  todoItem != nil {
            
            todoItem?.image = imageName
            todoItem?.title = titleTF.text!
            todoItem?.date = datePicker.date
            
        }else{
            let uuid = UUID()
            todoItem = TodoItem(id: uuid.description, image: imageName, title: titleTF.text!, date: datePicker.date)
            todos.append(todoItem!)
        }
        
       let _ =  self.navigationController?.popViewController(animated: true)
    }
    
}
