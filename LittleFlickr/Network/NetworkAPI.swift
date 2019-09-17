//
//  NetworkAPI.swift
//  LittleFlickr
//
//  Created by ibrahim DOĞAN on 17.09.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import Foundation
import Moya

public enum FlickrNetwork {
    case getRecent
}

extension FlickrNetwork: TargetType {
    
    public var baseURL: URL {
        return URL(string: "https://www.flickr.com/services/rest/?method=flickr.photos.getRecent&api_key=f9f329ad28c2bc2aa5fc027d37927509&format=json&nojsoncallback=1")!
    }
    
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
        case .getRecent:    return .requestParameters(parameters: [:], encoding: URLEncoding.default)
        }
    }
    
    public var headers: [String : String]? {
        return [:]
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
}
