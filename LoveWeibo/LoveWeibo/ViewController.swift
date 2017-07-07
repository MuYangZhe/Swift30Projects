//
//  ViewController.swift
//  LoveWeibo
//
//  Created by 牧易 on 17/7/6.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit
import Social

class ViewController: UIViewController {
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var genderControl: UISegmentedControl!
    @IBOutlet weak var datePicker: UIDatePicker!

    @IBOutlet weak var workTF: UITextField!
    @IBOutlet weak var salarySlider: UISlider!
    @IBOutlet weak var salaryLabel: UILabel!
    @IBOutlet weak var straightSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func changeSalary(_ sender: UISlider) {
        let i = Int(sender.value)
        salaryLabel.text = "¥\(i)k"
        
    }

    @IBAction func sendWeibo(_ sender: UIButton) {
        let name = nameTF.text
        let work = workTF.text
        let salary = salaryLabel.text
        
        if(name == "" || work == "" || salary == ""){
            showAlert(title: "Info Miss", message: "Please fill out the form", buttonTitle: "Ok")
            return;
        }
        
        var interestedIn:String? = "Women"
        if(genderControl.selectedSegmentIndex == 0 && !straightSwitch.isOn){
            interestedIn = "Man"
        }
        if(genderControl.selectedSegmentIndex == 1 && straightSwitch.isOn){
            interestedIn = "Man"
        }
        
        let gregorian = Calendar(identifier: .gregorian)
        let now = Date()
        let component = (gregorian as NSCalendar).components(NSCalendar.Unit.year, from: datePicker.date, to: now, options: [])
        
        let age = component.year
        
        let weibo = "Hi, I am \(name!). As a \(age!)-year-old \(work!) earning \(salary!)/year, I am interested in \(interestedIn). Feel free to contact me!"
        
        sendWeibo(weibo)
    }
    
    fileprivate func sendWeibo(_ weibo:String){
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeSinaWeibo){
            let weiboViewController:SLComposeViewController = SLComposeViewController.init(forServiceType: SLServiceTypeSinaWeibo)
            weiboViewController.setInitialText(weibo);
            self.present(weiboViewController, animated: true, completion: nil)
        }else{
            showAlert(title: "Weibo Unavailable", message: "Please configure your twitter account on device", buttonTitle: "Ok")
        }
    }
    
    
    fileprivate func showAlert(title:String,message:String,buttonTitle:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil);
    }

}

