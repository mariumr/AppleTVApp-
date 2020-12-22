//
//  CityTableViewCell.swift
//  Marium_FinalExam2020
//
//  Created by Xcode User on 2020-12-13.
//  Copyright © 2020 Xcode User. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    
    @IBOutlet var lblCity : UILabel!
    @IBOutlet var imgCity : UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
