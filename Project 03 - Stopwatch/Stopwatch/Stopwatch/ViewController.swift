//
//  ViewController.swift
//  Stopwatch
//
//  Created by 牧易 on 17/7/7.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    fileprivate var isPlaying:Bool = false
    fileprivate let singleStopwatch:Stopwatch = Stopwatch()
    fileprivate let totalStopwatch:Stopwatch = Stopwatch()
    fileprivate var records:[String] = []
    
    // MARK: disable landscape mode
    override var shouldAutorotate: Bool{
        return false
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask{
        return UIInterfaceOrientationMask.portrait
    }
    
    @IBOutlet weak var singleTimeLabel: UILabel!
    @IBOutlet weak var totalTimeLabel: UILabel!
    @IBOutlet weak var leftBtn: UIButton!
    @IBOutlet weak var rightBtn: UIButton!
    @IBOutlet weak var recordTV: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initCircleButton(leftBtn)
        initCircleButton(rightBtn)
        
//        leftBtn.setTitleColor(UIColor.gray, for: .normal)
        leftBtn.isEnabled = false
        
        recordTV.dataSource = self
        
        
    }
    
    fileprivate func initCircleButton(_ button: UIButton) {
        button.layer.cornerRadius = 0.5 * button.bounds.size.width
        button.backgroundColor = UIColor.white
    }

    @IBAction func startAndStop(_ sender: UIButton) {
        if(isPlaying){
            stop()
        }else{
            start()
        }
        
    }
    
    
    
    @IBAction func lapAndReset(_ sender: UIButton) {
        if(isPlaying){
            records.append((singleTimeLabel.text?.description)!)
            recordTV.reloadData()
            singleStopwatch.counter = 0
            singleTimeLabel.text = "00:00:00"
            
            
        }else{
            //reset
            singleTimeLabel.text = "00:00:00"
            totalTimeLabel.text = "00:00:00"
            singleStopwatch.counter = 0
            totalStopwatch.counter = 0
            
            leftBtn.isEnabled = false
            updateBtn(btn: leftBtn, title: "Lap", titleColor: UIColor.lightGray)
            
            
            records.removeAll()
            recordTV.reloadData()
        }
    }

    func start() {
        
        rightBtn.setTitleColor(UIColor.red, for: .normal)
        rightBtn.setTitle("Stop", for: .normal)
        
        isPlaying = true
        
        singleStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(updateSingleTimeLabel), userInfo: nil, repeats: true);
        totalStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: self, selector: #selector(updateTotalTimeLabel), userInfo: nil, repeats: true);
        
        leftBtn.isEnabled = true
        updateBtn(btn: leftBtn, title: "Lop", titleColor: UIColor.black)
        
        
    }
    
    
    func stop(){
        updateBtn(btn: rightBtn, title: "Start", titleColor: UIColor.green)
        //set left button to reset
        updateBtn(btn: leftBtn, title: "Reset", titleColor: UIColor.black)
        
        
        isPlaying = false
        singleStopwatch.timer.invalidate()
        totalStopwatch.timer.invalidate()
    }
    
    fileprivate func updateBtn(btn:UIButton , title:String,titleColor:UIColor){
        btn.setTitle(title, for: .normal)
        btn.setTitleColor(titleColor, for: .normal)
    }
    
    
    
    
    
    func updateLabelWithStopwatch(label:UILabel,stopwatch:Stopwatch) {
        stopwatch.counter = stopwatch.counter+0.035
        
        label.text = stopwatch.showTime()
        
        
    }
    
    func updateTotalTimeLabel(){
        updateLabelWithStopwatch(label: totalTimeLabel, stopwatch: totalStopwatch)
    }
    
    func updateSingleTimeLabel() {
        updateLabelWithStopwatch(label: singleTimeLabel, stopwatch: singleStopwatch)
    }
    
   

}

extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        cell.textLabel?.text = records[indexPath.row]
        
        return cell
        
    }
}

