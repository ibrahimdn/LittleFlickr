//
//  FlickrModel.swift
//  LittleFlickr
//
//  Created by ibrahim DOĞAN on 17.09.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import Foundation

// MARK: - FlickrModel
class FlickrModel: Codable {
    let photos: FlickrPhotos?
    let stat: String?
    
    init(photos: FlickrPhotos?, stat: String?) {
        self.photos = photos
        self.stat = stat
    }
}

// MARK: - Photos
class FlickrPhotos: Codable {
    let page, pages, perpage: Int?
    let total: Int?
    let photo: [FlickrPhoto]?
    
    init(page: Int?, pages: Int?, perpage: Int?, total: Int?, photo: [FlickrPhoto]?) {
        self.page = page
        self.pages = pages
        self.perpage = perpage
        self.total = total
        self.photo = photo
    }
}

// MARK: - Photo
class FlickrPhoto: Codable {
    let id, owner, secret, server: String?
    let farm: Int?
    let title: String?
    let ispublic, isfriend, isfamily: Int?
    
    init(id: String?, owner: String?, secret: String?, server: String?, farm: Int?, title: String?, ispublic: Int?, isfriend: Int?, isfamily: Int?) {
        self.id = id
        self.owner = owner
        self.secret = secret
        self.server = server
        self.farm = farm
        self.title = title
        self.ispublic = ispublic
        self.isfriend = isfriend
        self.isfamily = isfamily
    }
}
