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

class HomeService
{
    
    
    func getHomeService() -> [HomeModel]
    {
           Alamofire.request("https://alarabyqa.ihorizons.com/mobile-app/home?items=10&page=1", method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil)
                    .responseJSON { response in
                        switch(response.result)
                        {
                        case .failure(let error):
                            print(error)
                        case .success(let value):
                            let json = JSON(value)
                           print(json[0]["nid"]) //json[0]["nid"]

                            break
     
                        }
        
    }
    
    
}
