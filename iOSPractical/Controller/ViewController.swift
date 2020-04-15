//
//  ViewController.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 4/12/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {
    
    var news :  [HomeModel]? = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        requestData()
    }
    
    private func requestData()
    {
        HomeService.getHomeService { (error, true, data) in
            if let news = data
            {
                print( news[0].nid)
            }
        }
    }
}
//extension ViewController : UITableViewDtaSource
//
//{
//    
//}

