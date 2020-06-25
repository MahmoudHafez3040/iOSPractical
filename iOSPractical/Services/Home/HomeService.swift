//
//  HomeService.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 4/13/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import  AlamofireObjectMapper

class HomeService
{
    //MARK: Home Service
    class func getHomeServic(pageNumber : String , completion : @escaping( _ error: Error? , _ success: Bool, _ data :[HomeModel]?)->Void)
    {
        HomeRepoService.getHomeRepo(pageNum: pageNumber) { (error, seccess, dataApi) in
            if let apiData = dataApi
            {
                let modelData = self.TransationToModel(apiData)
                completion(nil , true , modelData)
            }
        }
        
    }
    class func TransationToModel (_ dataApi : [HomeApi])->[HomeModel]
    {
        var lst = [HomeModel]()
        for item in dataApi
        {
            let homeModel = HomeModel.init(item.nid,item.type,item.perspective,item.title,item.fieldMedia,item.entityType,item.display_image,item.content_link,item.fieldTemplate, publishDate: item.publishDate)
            lst.append(homeModel)
        }
        return lst
    }
    
//MARK: Menu Service
    class func getMenuServic(completion : @escaping( _ error: Error? , _ success: Bool, _ data :[MenuModel]?)->Void)
    {
        HomeRepoService.getMenuRepo() { (error, seccess, dataApi) in
            if let apiData = dataApi
            {
                let modelData = self.TransationToModel(apiData)
                completion(nil , seccess , modelData)
            }
        }
        
    }
    class func TransationToModel (_ dataApi : [MenuApi])->[MenuModel]
    {
        var lst = [MenuModel]()
        for item in dataApi
        {
            let menuModel = MenuModel.init(item.label,item.lableEnglish,item.section)
            lst.append(menuModel)
        }
        return lst
    }
}
