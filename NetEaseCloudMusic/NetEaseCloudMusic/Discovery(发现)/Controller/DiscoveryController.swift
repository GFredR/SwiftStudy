//
//  DiscoveryController.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/1.
//

import UIKit

class DiscoveryController: UIViewController {
    var bannerModel: BannerModel?
    let banner = BannerView(bannerFrame: CGRect(x: 0, y: NavHeight, width: Int(ScreenWidth) , height: 170))
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBannerData()
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        banner.bannerPage.center.x = self.view.center.x
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
            
            for i in 0..<(self.bannerModel!.banners.count) {
                let a = self.bannerModel!.banners[i].pic
                self.banner.imgArr.append(a)
            }
            self.banner.addSubview(self.banner.bannerView)
            self.banner.addSubview(self.banner.bannerPage)
            self.view.addSubview(self.banner)
            self.banner.bannerPage.center.x = self.view.center.x
            print(self.banner.imgArr)
        } failure: { (errcode, message) in
            print(message)
        }

    }
}
