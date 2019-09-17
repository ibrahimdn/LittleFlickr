//
//  ViewController.swift
//  LittleFlickr
//
//  Created by ibrahim DOĞAN on 17.09.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import UIKit
import Moya

class MainViewContoller: UITableViewController {
    
    let flickrProvider = MoyaProvider<FlickrNetwork>()

    override func viewDidLoad() {
        super.viewDidLoad()
        getSearchResults()
        // Do any additional setup after loading the view.
    }

    func getSearchResults() {

        flickrProvider.request(.getRecent) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let response):
                do {
                    print(try response.mapJSON())
                  
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error.response?.data as Any)
                if let code = error.response?.statusCode {
                    if code == 401 {
                        print("401")
                    }else{
                        print(error)
                        
                    }
                }
            }
        }
    }

}

