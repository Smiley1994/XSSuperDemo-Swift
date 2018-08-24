//
//  XSIndexViewController.swift
//  XSSuperDemo-Swfit
//
//  Created by 晓松 on 2018/7/13.
//  Copyright © 2018年 GoodMorning. All rights reserved.
//

import UIKit

class XSIndexViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var navigationView : XSIndexNavigationView!
    
    var tableView : UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: true)
        view.backgroundColor = UIColor.randomColor
        
        createNavigation()
//        createTableView()
    }
    
    func createNavigation() {
        navigationView = XSIndexNavigationView()
        view.addSubview(navigationView)
        navigationView.snp.makeConstraints { (make) in
            make.left.top.right.equalTo(view)
            make.height.equalTo(84)
        }
        
    }
    
    
    func createTableView() {
        tableView = UITableView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        tableView.snp.makeConstraints { (make) in
            make.edges.equalTo(self.view)
            make.top.equalTo(navigationView.snp.bottom)
        }
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        cell?.contentView.backgroundColor = UIColor.randomColor
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let playerViewController = XSPlayerViewController()
        self.tabBarController?.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(playerViewController, animated: true)
        
    }

}
