//
//  ManTabBarController.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 6/26/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import Foundation
import  UIKit
class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        // let home =   viewControllers![0] as! SWRevealViewController
        let nav1 = generateNavController(vc: SWRevealViewController(), title: "Home")
        let nav2 = generateNavController(vc: NotificationViewController(), title: "Notification")
        let nav3 = generateNavController(vc: NewsPaperViewController(), title: "NewsPaper")
        let nav4 = generateNavController(vc: MoreViewController(), title: "More")
           viewControllers = [nav1,nav2,nav3,nav4]
        
       //home.navigationItem.title="Home"
            }
    fileprivate func generateNavController(vc: UIViewController,title: String) -> UINavigationController
    {
        let navController = UINavigationController(rootViewController: vc)
        navController.title = title
        return navController
    }
    
}
