//
//  NetworkAPI.swift
//  LittleFlickr
//
//  Created by ibrahim DOĞAN on 17.09.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import Foundation
import Moya

let key = "f9f329ad28c2bc2aa5fc027d37927509"
let format = "json"
let nojsoncallback = "1"

public enum FlickrNetwork {
    case getRecent(per_page: String,page: String)
}

extension FlickrNetwork: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent")!
    }
    // https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=f9f329ad28c2bc2aa5fc027d37927509&per_page=2&page=1&format=json&nojsoncallback=1
    public var path: String {
        switch self {
        case .getRecent: return ""
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .getRecent: return .get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .getRecent(let per_page, let page):    return .requestParameters(parameters: [    "api_key": key,
                                                                                            "per_page": per_page,
                                                                                            "page":page,
                                                                                            "format": format,
                                                                                            "nojsoncallback":nojsoncallback], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
