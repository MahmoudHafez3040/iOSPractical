//
//  MenuViewController.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 6/23/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import SwiftyJSON
import  Foundation
import  Kingfisher
import  SideMenu

class MenuViewController: UIViewController,UITableViewDelegate,UITableViewDataSource
{

   
    var menuData: [MenuModel] = []

    @IBOutlet weak var tableViewNew: UITableView!
    override func viewDidLoad() {
        navigationController?.setNavigationBarHidden(true, animated: false)
        requestMenuData()
        registerCellForMenuTableView()
    }

    private func requestMenuData()
    {
        HomeService.getMenuServic( completion:  { (error, seccess, data) in
            if let modelData = data
            {
                self.menuData.append(contentsOf: modelData)
                self.tableViewNew?.reloadData()
            }
        })
    }
    func registerCellForMenuTableView()
    {
        let viewCellNib66 = UINib(nibName:"MenuViewCell" ,bundle:Bundle.main)
        tableViewNew?.register(viewCellNib66, forCellReuseIdentifier: "MenuIdenIdeniden")

    }


     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.menuData.count
    }

      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuIdenIdeniden", for: indexPath) as! MenuViewCell
        cell.lbllableText?.text = self.menuData[indexPath.row].label
        return  cell
    }
}
