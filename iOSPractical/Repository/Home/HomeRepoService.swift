//
//  HomeRepoService.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 4/14/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import Foundation
import Alamofire

class HomeRepoService
{
    class func getHomeRepo(completion : @escaping( _ error: Error? , _ success: Bool, _ data :[HomeApi]?)->Void)
    {
        let URL = AppUrls.Home 
        Alamofire.request(URL).responseArray{ (response: DataResponse<[HomeApi]>) in
                   completion(nil,true, response.result.value)
               }
    }
}
