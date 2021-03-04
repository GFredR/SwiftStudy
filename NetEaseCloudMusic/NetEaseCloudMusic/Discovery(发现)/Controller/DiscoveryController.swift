//
//  DiscoveryController.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/1.
//

import UIKit

class DiscoveryController: UIViewController {
    var bannerModel: BannerModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBannerData()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    

}
extension DiscoveryController {
    func loadBannerData() -> Void {
//        DispatchQueue.global().async {
//            DispatchQueue.main.async {
//
//            }
//        }
        HttpRequest.loadData(target: BannerAPI.bannerInfo(type: "2"), model: BannerModel.self) {
            (model) in
            self.bannerModel = model
            print(self.bannerModel ?? "a")
        } failure: { (errcode, message) in
            print(message)
        }

    }
}
