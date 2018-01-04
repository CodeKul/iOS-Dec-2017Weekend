//
//  CustomTableViewCell.swift
//  CustomCellDemo
//
//  Created by Varun on 31/12/17.
//  Copyright © 2017 Codekul. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView : UIImageView!
    @IBOutlet var nameLbl : UILabel!
    @IBOutlet var DOBLbl : UILabel!
    @IBOutlet var scoreLbl : UILabel!
    @IBOutlet var btnGo : UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
