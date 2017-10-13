//
//  HorizontalScroller.swift
//  BlueLibrarySwift
//
//  Created by 牧易 on 17/8/8.
//  Copyright © 2017年 MuYi. All rights reserved.
//

import UIKit
// Use Delegate and Protocol to implement Adapter Pattern
@objc protocol HorizontalScrollerDelegate{
    
    func numberOfViewForHorizontalScroller (_ scroller: HorizontalScroller) -> Int
    
    func horizontalScrollerViewAtIndex(_ scroller: HorizontalScroller , index:Int) -> UIView
    
    func horziontalScrollerClickedViewAtIndex (_ scroller:HorizontalScroller , index:Int)
    // return the index of the initial view to display. this method is optional
    // and defaults to 0 if it's not implemented by the delegate
    @objc optional func initialViewIndex (_ scroller:HorizontalScroller) -> Int
}

class HorizontalScroller: UIView {
    weak var delegate:HorizontalScrollerDelegate?
    
    // MARK: - Variables
    fileprivate let VIEW_PADDING = 10
    fileprivate let VIEW_DIMENSIONS = 100
    fileprivate let VIEWS_OFFSET = 100
    
    fileprivate var scroller:UIScrollView!
    
    var viewArray:[UIView] = []
    
    // MARK: - Lifecycle
    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeScrollView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initializeScrollView()
        
    }
    
    
    
    func initializeScrollView(){
        scroller = UIScrollView()
        scroller.delegate = self
        addSubview(scroller)
        
        scroller.translatesAutoresizingMaskIntoConstraints = false
        // apply constraints
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .trailing, relatedBy: .equal, toItem: self, attribute: .trailing, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1.0, constant: 0.0))
        self.addConstraint(NSLayoutConstraint(item: scroller, attribute: .bottom, relatedBy: .equal, toItem: self, attribute: .bottom, multiplier: 1.0, constant: 0.0))

        
        //add tap recognizer
        let tap = UITapGestureRecognizer(target: self, action: #selector(HorizontalScroller.scrollerTapped(_:)))
        scroller.addGestureRecognizer(tap)
        
        
        
    }
    
    // MARK: - Public Functions
    func scrollerTapped(_ gesture:UITapGestureRecognizer){
        
    }
    
    

}

extension HorizontalScroller:UIScrollViewDelegate {
    
}

