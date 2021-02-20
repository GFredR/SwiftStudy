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
        switch banner.bannerPage.currentPage {
        case 0:
            let goldStoryBoard = UIStoryboard(name: "Finance", bundle: nil)
            let goldVC = goldStoryBoard.instantiateViewController(withIdentifier: "GoldController")
            self.navigationController?.pushViewController(goldVC, animated: true)
        case 1:
            let changeRateStoryBoard = UIStoryboard(name: "Finance", bundle: nil)
            let changeRateVC = changeRateStoryBoard.instantiateViewController(withIdentifier: "ChangeRateController")
            self.navigationController?.pushViewController(changeRateVC, animated: true)
        default:
            let lotteryStoryBoard = UIStoryboard(name: "Finance", bundle: nil)
            let lotteryVC = lotteryStoryBoard.instantiateViewController(withIdentifier: "LotteryController")
            self.navigationController?.pushViewController(lotteryVC, animated: true)
        }
        print(banner.bannerPage.currentPage)
    }
}
