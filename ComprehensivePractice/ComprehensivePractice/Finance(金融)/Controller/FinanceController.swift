//
//  FinanceController.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/2.
//

import UIKit

class FinanceController: UIViewController {
    lazy var banner: BannerView = BannerView(bannerFrame: CGRect(x: 0, y: CGFloat(NavHeight), width: ScreenWidth, height: ScreenHeight / 4))
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(touchBanner))
        banner.addGestureRecognizer(tap)
        view.addSubview(banner)
        // Do any additional setup after loading the view.
    }
    
}

extension FinanceController {
    @objc func touchBanner() -> Void {
        print("hahha")
    }
}
