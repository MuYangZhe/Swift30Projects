//
//  PhotoCommonViewController.swift
//  PhotoScroll
//
//  Created by 牧易 on 17/7/20.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit

class PhotoCommenViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var scrollView: UIScrollView!

    
    var imageName:String?
    var photoIndex:Int?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let imageName = imageName {
            imageView.image = UIImage.init(named: imageName)
        }
        
        NotificationCenter.default.addObserver(self,
                                               selector: Selector.keyboardWillShowHandler,
                                               name: NSNotification.Name.UIKeyboardDidShow,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: Selector.keyboardWillHideHandler,
                                               name: NSNotification.Name.UIKeyboardDidHide,
                                               object: nil)
        let generalTap = UITapGestureRecognizer(target: self, action: Selector.generalTap)
        view.addGestureRecognizer(generalTap)
        
        let zoomingTap = UITapGestureRecognizer(target: self, action: Selector.zoomingTap)
        imageView.addGestureRecognizer(zoomingTap)
        
       
    }
    
    deinit{
        NotificationCenter.default.removeObserver(self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    fileprivate func adjustInsetForKeyboard (isShow:Bool , notifcation:Notification){
        guard let value = notifcation.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue else {
            return
        }
        let keyboardFrame = value.cgRectValue
        let adjuestmentHeight = (keyboardFrame.height + 20 )*(isShow ? 1 : -1)
        
        scrollView.contentInset.bottom += adjuestmentHeight
        scrollView.scrollIndicatorInsets.bottom += adjuestmentHeight
    }
    
    
    func keyboardWillShow(notifcation:Notification){
        adjustInsetForKeyboard(isShow: true, notifcation: notifcation)
    }
    
    func keyboardWillHide(notifcation:Notification) {
        adjustInsetForKeyboard(isShow: false, notifcation: notifcation)
    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }
    
    func openZoomingController(sender:AnyObject){
        performSegue(withIdentifier: "zooming", sender: sender);
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "zooming" ,
            let zoomPhotoViewController = segue.destination as? ZoomPhotoViewController{
            zoomPhotoViewController.photoName = imageName
        }
    }

}

fileprivate extension Selector {
    static let keyboardWillShowHandler = #selector(PhotoCommenViewController.keyboardWillShow(notifcation:))
    static let keyboardWillHideHandler = #selector(PhotoCommenViewController.keyboardWillHide(notifcation:))
    static let generalTap = #selector(PhotoCommenViewController.dismissKeyboard)
    
    static let zoomingTap = #selector(PhotoCommenViewController.openZoomingController(sender:))
}

