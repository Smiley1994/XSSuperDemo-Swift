//
//  ViewController.swift
//  Sample
//
//  Created by Good_Morning_ on 2018/7/4.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit
import XSCommon


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.randomColor
        
//        let button = XSIQiYiPlayButton(frame: CGRect(x: 30, y: 30, width: 30, height: 30), status: .IQiYiPlayStatusPlay, color: UIColor.randomColor)
//        view.addSubview(button)

//        let imageView = UIImageView(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
//        imageView.image = UIImage().videoPreviewImage(videoUrl: "http://117.48.217.172/Gh6HiK7UF4g.mp4")
//        view.addSubview(imageView)
        
//        let circle = XSAnimationCircleView(frame: CGRect(x: 100, y: 400, width: 60, height: 60))
//        
//        self.view.addSubview(circle)

        
        print(percentageWithScreenHeight())
        print(percentageWithScreenWidth())
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

