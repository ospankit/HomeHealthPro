//
//  DashBoardSideMenuTableViewCell.swift
//  HomeHealthPro
//
//  Created by Ankit on 02/03/20.
//  Copyright © 2020 HomeHealthPro. All rights reserved.
//

import UIKit

class DashBoardSideMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var dashBoardSideMenuImagevIew: UIImageView!
    @IBOutlet weak var dashBoardSideMenuLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
