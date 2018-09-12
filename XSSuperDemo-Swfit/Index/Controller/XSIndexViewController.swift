//
//  XSIndexViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit
import Alamofire


class XSIndexViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var navigationView : XSIndexNavigationView!
    
    var tableView : UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        createNavigation()
        createTableView()
        
        Alamofire.request(WeatherUrl).response { response in // method defaults to `.get`
            let data = response.data!
            
            print(data)
        }
        
    }
    
    func createNavigation() {
        navigationView = XSIndexNavigationView()
        view.addSubview(navigationView)
        navigationView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(view)
            make.height.equalTo(88)
        }
        
    }
    
    
    func createTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.left.bottom.right.equalTo(self.view)
            make.top.equalTo(navigationView.snp.bottom)
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return XSIndexDefaultCell.calculateHeight()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = XSIndexDefaultCell(style: .default, reuseIdentifier: "cell")
        }
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerViewController = XSPlayerViewController()
        playerViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(playerViewController, animated: true)
        
    }

}
