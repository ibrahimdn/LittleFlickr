//
//  MainTableViewCell.swift
//  LittleFlickr
//
//  Created by ibrahim doğan on 17.09.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import UIKit
import Kingfisher
class MainTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var flickrImage: UIImageView!
    
    var flickrData: FlickrPhoto!{
        didSet{
            titleLbl.text = flickrData.title
            flickrImage.kf.indicatorType = .activity
            if let url =  URL(string: flickrData.url_m ?? String()) {
                flickrImage.kf.setImage(with: url)
            }
        }
    }
    
    override func awakeFromNib() {
        self.backgroundColor = UIColor.backgroundWhiteColor
        titleLbl.textColor = UIColor.textDarkColor
        selectionStyle = .none
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
