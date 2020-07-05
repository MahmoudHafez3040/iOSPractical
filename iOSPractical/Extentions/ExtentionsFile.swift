//
//  ExtentionsFile.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 6/30/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//


import Foundation

extension String {
    var localized : String
    {
        return NSLocalizedString(self, comment: "")
    }
}
