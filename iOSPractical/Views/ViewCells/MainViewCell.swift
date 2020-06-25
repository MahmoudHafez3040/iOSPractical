//
//  ManTableViewCell.swift
//  iOSPractical
//
//  Created by MahmoudHafez on 4/15/20.
//  Copyright © 2020 MahmoudHafez. All rights reserved.
//

import UIKit

class MainViewCell: UITableViewCell {

    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var imgCell: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
