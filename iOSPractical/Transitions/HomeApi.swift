//
//  HomeApi.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 4/14/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import Foundation
import  ObjectMapper

class HomeApi : Mappable
{
    var nid  : String?
    var title  : String?
    
    required init?(map: Map){
        
    }
    init(_ nid:String ,_ title:String) {
        
        self.nid = nid
        self.title = title
    }
    
    func mapping(map: Map) {
        nid <- map["nid"]
        title <- map["field_mobile_title"]
    }
}
