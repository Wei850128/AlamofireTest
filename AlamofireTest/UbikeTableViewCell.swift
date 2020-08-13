//
//  UbikeTableViewCell.swift
//  AlamofireTest
//
//  Created by 劉家瑋 on 2020/8/10.
//  Copyright © 2020 劉家瑋. All rights reserved.
//

import UIKit

class UbikeTableViewCell: UITableViewCell {

    @IBOutlet weak var address: UILabel!
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
