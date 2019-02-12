//
//  XSIndexViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit
import Alamofire
import XSCommon


class XSIndexViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var navigationView : XSIndexNavigationView!
    
    var tableView : UITableView!
    
    var dataArray = [String]()
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        dataArray = ["ScrollCard", "NoteDetail", "Other", "Other"]
        
        createNavigation()
        createTableView()
        
//        Alamofire.request(WeatherUrl).response { response in // method defaults to `.get`
//            let data = response.data!
//            print(data)
//        }
        
    }
    
    func createNavigation() {
        navigationView = XSIndexNavigationView(frame: CGRect(x: 0, y: 0, width: ScreenWidth, height: NavgationBarHeight))
        view.addSubview(navigationView)
    }
    
    
    func createTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(XSIndexDefaultCell.self, forCellReuseIdentifier: "default")
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.view)
            make.top.equalTo(navigationView.snp.bottom)
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return XSIndexDefaultCell.calculateHeight()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "default") as! XSIndexDefaultCell
        cell = XSIndexDefaultCell(style: .default, reuseIdentifier: "default")
        cell.headerView.titleLabel.text = dataArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let type = dataArray[indexPath.row]
        
        if type == "ScrollCard" {
            openScrollCardViewController()
        } else if type == "NoteDetail" {
            let playerViewController = XSPlayerViewController()
            playerViewController.hidesBottomBarWhenPushed = true
            navigationController?.pushViewController(playerViewController, animated: true)
        }
        
    }
    
    func openScrollCardViewController() {
        let playerViewController = XSScrollCardViewController()
        playerViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(playerViewController, animated: true)
    }

}
