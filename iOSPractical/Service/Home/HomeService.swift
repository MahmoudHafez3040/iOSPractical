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
    class func getHomeService(completion : @escaping( _ error: Error? , _ success: Bool, _ data :[HomeModel]?)->Void)
    {
        HomeRepoService.getHomeRepo { (error, success, dataApi) in
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
                 let homeModel = HomeModel.init(item.nid , item.title)
                 lst.append(homeModel)
             }
             return lst
         }
    //  class func getHomeService(completion : @escaping( _ error: Error? , _ success: Bool, _ data :[HomeModel]?)->Void)
    //    {
    //        Alamofire.request("https://alarabyqa.ihorizons.com/mobile-app/home?items=10&page=1", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
    //            .validate(statusCode: 200..<300)
    //            .responseJSON { response in
    //                switch response.result
    //                {
    //                case .failure(let error):
    //                    print(error)
    //                    completion(error,false, nil)
    //                case .success(let value):
    //                    let homeNews = HomeTransationToModel(JSON(value))
    //                    print(homeNews[0].nid)
    //                    completion(nil,true, homeNews)
    //                }
    //        }
    
}
