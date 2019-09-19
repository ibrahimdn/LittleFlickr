//
//  SubViewController.swift
//  LittleFlickr
//
//  Created by ibrahim doğan on 19.09.2019.
//  Copyright © 2019 ibrhmdn. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
 
    var data = FlickrPhoto(id: String(), owner: String(), secret: String(), server: String(), farm: Int(), title: String(), ispublic: Int(), isfriend: Int(), isfamily: Int(), url_m: String())
    
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var detailLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailImage.kf.setImage(with: URL(string: data.url_m!))
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.navigationItem.largeTitleDisplayMode = .automatic

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
