//
//  LoadingTableViewCell.swift
//  LittleFlickr
//
//  Created by ibrahim doğan on 19.09.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import UIKit

class LoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.backgroundWhiteColor

        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
