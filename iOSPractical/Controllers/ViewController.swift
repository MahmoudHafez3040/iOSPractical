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
import  Foundation
import  Kingfisher
//MARK: Home view controller
class ViewController: UIViewController {
    // MARK: Variables
    @IBOutlet weak var btnMenu: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    private var pageNum :  Int = 1
    private var  isFeteching: Bool = false
    private var loadMore : Bool = true
    var news :  [HomeModel] = []
    
    // MARK: Page Event
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCellForTableView()
        requestHomeData()
        setMenubtn(btnMenu)
    }
    //MARK: Create a function for menu action
    func setMenubtn(_ menuBar :UIBarButtonItem)
    {
        menuBar.target=revealViewController()
        menuBar.action=#selector(SWRevealViewController.revealToggle(_:))
        view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
}
extension ViewController {
    func registerCellForTableView()
    {
        let viewCellNib1 = UINib(nibName:"MainViewCell" ,bundle: nil)
        self.tableView.register(viewCellNib1, forCellReuseIdentifier: "menuViewCellIden")
        let viewCellNib2 = UINib(nibName:"ArticleViewCell" ,bundle: nil)
             self.tableView.register(viewCellNib2, forCellReuseIdentifier: "ArticleViewCellIdentifier")
        let viewCellNib3 = UINib(nibName:"sectionImageViewCell" ,bundle: nil)
                  self.tableView.register(viewCellNib3, forCellReuseIdentifier: "sectionImageViewCelliden")
        let viewCellNib4 = UINib(nibName:"PodcastViewCell" ,bundle: nil)
                  self.tableView.register(viewCellNib4, forCellReuseIdentifier: "PodcastViewCellIden")
        let viewCellNib5 = UINib(nibName:"VideoViewCell" ,bundle: nil)
                  self.tableView.register(viewCellNib5, forCellReuseIdentifier: "VideoViewCellIden")
    }
    private func requestHomeData()
    {
        self.isFeteching = true
        HomeService.getHomeServic(pageNumber: String(self.pageNum) , completion:  { (error, true, data) in
            if let modelData = data
            {
                self.news.append(contentsOf: modelData)
                self.tableView.reloadData()
                self.pageNum = self.pageNum + 1
            }
            else
            {
                self.loadMore = false
            }
            self.isFeteching = false
        })
    }
  
}
extension ViewController:  UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.news.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch self.news[indexPath.row].entityType{
        case "node":
            switch self.news[indexPath.row].fieldTemplate {
            //  Videos Article
            case "14":
                let videoTableviewCell = tableView.dequeueReusableCell(withIdentifier: "VideoViewCellIden", for: indexPath) as! VideoViewCell
                return  videoTableviewCell
            // No Image article
            case "10":
                if self.news[indexPath.row].display_image == true
                {
                    let sectionImageWithNoImageTableviewCell = tableView.dequeueReusableCell(withIdentifier: "SectionItemWithNoImageIden", for: indexPath) as! sectionImageWithNoImageViewCell
                    sectionImageWithNoImageTableviewCell.lblTitle.text = self.news[indexPath.row].title
                    return  sectionImageWithNoImageTableviewCell
                }
                else
                {
                    let sectionItemTableviewCell = tableView.dequeueReusableCell(withIdentifier: "sectionImageViewCelliden", for: indexPath) as! sectionImageViewCell
                    sectionItemTableviewCell.lblTitle.text = self.news[indexPath.row].title
                    sectionItemTableviewCell.lbldate.text = self.news[indexPath.row].publishDate
                    if let urlString = self.news[indexPath.row].fieldMedia
                    {
                        let url = URL(string: urlString)
                        sectionItemTableviewCell.imgImageSource?.kf.setImage(with: url)
                    }
                    return  sectionItemTableviewCell
                }
            // Podcast Article
            case "18":
                let podcastTableviewCell = tableView.dequeueReusableCell(withIdentifier: "PodcastViewCellIden", for: indexPath) as! PodcastViewCell
                return  podcastTableviewCell
            //Section item with image
            default:
                let sectionItemTableviewCell = tableView.dequeueReusableCell(withIdentifier: "sectionImageViewCelliden", for: indexPath) as! sectionImageViewCell
                sectionItemTableviewCell.lblTitle.text = self.news[indexPath.row].title
                sectionItemTableviewCell.lbldate.text = self.news[indexPath.row].publishDate
                if let urlString = self.news[indexPath.row].fieldMedia
                {
                    let url = URL(string: urlString)
                    sectionItemTableviewCell.imgImageSource?.kf.setImage(with: url)
                }
                return  sectionItemTableviewCell
            }
        case "media":
            break
        default:
            break
        }
        return  UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension ViewController : UITableViewDataSourcePrefetching{
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        for index in indexPaths
        {
            if index.row >= self.news.count - 5 && !isFeteching && loadMore
            {
                self.requestHomeData()
                print("Page number \(self.pageNum)")
            }
            break
        }
    }
}




