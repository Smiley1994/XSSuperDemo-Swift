//
//  ViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by Good_Morning_ on 2018/6/28.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    
    var iQiYiButton : XSIQiYiPlayButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        iQiYiButton = XSIQiYiPlayButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50), status: .IQiYiPlayStatusPlay)
        iQiYiButton.addTarget(self, action: #selector(click), for: .touchUpInside)
        self.view.addSubview(iQiYiButton)
        
        
        
    }
    
    @objc func click() {
        if iQiYiButton.buttonStatus == .IQiYiPlayStatusPause {
            iQiYiButton.buttonStatus = .IQiYiPlayStatusPlay
        } else {
            iQiYiButton.buttonStatus = .IQiYiPlayStatusPause
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

