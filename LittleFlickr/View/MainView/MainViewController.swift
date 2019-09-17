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
    var per_page = 20
    var page = 0
    
    var photoData = [FlickrPhoto]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.backgroundColor = UIColor.backgroundDarkColor
        updateTitle()

        getRecentResults(pageCounter: page)
        
        // Do any additional setup after loading the view.
    }
    func updateTitle(){
        navigationController?.navigationBar.topItem?.title = "Little Flickr"
        navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationItem.largeTitleDisplayMode = .never
    }
    func getRecentResults(pageCounter: Int) {

        flickrProvider.request(.getRecent(per_page: String(per_page), page: String(pageCounter))) { [weak self] result in
            guard self != nil else { return }
            
            switch result {
            case .success(let response):
                do {
                    print(try response.mapJSON())
                    let datas = try JSONDecoder().decode(FlickrModel.self, from: response.data)
                    for data in (datas.photos?.photo)! {
                        self!.photoData.append(data)
                    }
                print(self!.photoData.count)
                  self!.tableView.reloadData()
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

extension MainViewContoller{
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath)
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MainTableViewCell{
           // cell.backgroundColor = .backgroundDarkColor
            cell.flickrData = photoData[indexPath.row]
           return cell
        }else{
            return UITableViewCell()
        }
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photoData.count
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 400
    }
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        print("Willdisplay")
        print(indexPath)
            if photoData.count-1 == indexPath.row{
                page += 1
                getRecentResults(pageCounter: page)
                
            }
    }
   
}
