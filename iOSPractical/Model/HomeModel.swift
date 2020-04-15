//
//  HomeModel.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 4/12/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import Foundation
import  ObjectMapper

class HomeModel
{
    var nid : String?
    var title : String?
    
 
    init(_ nid:String? ,_ title:String?) {
        self.nid=nid
        self.title=title
        
    }

}
