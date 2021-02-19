//
//  BannerView.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/19.
//

import UIKit

class BannerView: UIView, UIScrollViewDelegate {
    lazy var bannerView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight / 4)
        scrollView.contentSize = CGSize(width: CGFloat((imgArr.count + 1)) * ScreenWidth, height: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        for i in 0..<(imgArr.count + 1) {
            let imgView = UIImageView(frame: CGRect(x: CGFloat(i) * ScreenWidth, y: 0, width: ScreenWidth, height: ScreenHeight / 4))
            if i == imgArr.count {
                imgView.image = UIImage(named: imgArr[0])
            } else {
                imgView.image = UIImage(named: imgArr[i])
            }
            // 以下是kingfisher的用法
            
//            if i == imgArr.count {
//                imgView.kf.setImage(with: URL(string: imgArr[0]))
//
//                imgView.kf.setImage(with: URL(string: imgArr[0]), placeholder: UIImage(named: "1"), options: [KingfisherOptionsInfoItem.fromMemoryCacheOrRefresh]) { (result, error) in
//                    if (result != 0) {
//                        print(error)
//                    } else {
//                        print(result)
//                    }
//
//                }
//
//            } else {
//                imgView.kf.setImage(with: URL(string: imgArr[i]), placeholder: UIImage(named: "1"), options: [KingfisherOptionsInfoItem.fromMemoryCacheOrRefresh]) { (result, error) in
//                    if (result != 0) {
//                        print(error)
//                    } else {
//                        print(result)
//                    }
//
//                }
//            }
            scrollView.addSubview(imgView)
//            imgView.addSubview(bannerPage)
        }
        
        createTimer()
        
        return scrollView
    }()
    
    lazy var bannerPage: UIPageControl = {
        let pageControl: UIPageControl = UIPageControl()
        pageControl.frame = CGRect(x: ScreenWidth - 150, y: ScreenHeight / 4 - 80, width: 200, height: 100)
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
        
        return pageControl
    }()
    
    var bannerTimer: Timer?
    
    lazy var imgArr: Array<String> = {
        let arr = ["gold","exchange_rate","lottery"]
        return arr
    }()
    lazy var pageCount: Int = {
        let pageNum = imgArr.count
        return pageNum
    }()
    
    lazy var currentPageCount: Int = {
        let currentPage = imgArr.count
        return currentPage
    }()
    
    lazy var oldScrollOffset: CGFloat = {
        let offset: CGFloat = CGFloat()
        return offset
    }()
    
    lazy var timerInterInterval: Double = {
        let interval: Double = 2.0
        return interval
    }()
    
    init(bannerFrame: CGRect) {
        super.init(frame: bannerFrame)
        self.frame = bannerFrame
        self.addSubview(bannerView)
        self.addSubview(bannerPage)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createTimer() -> Void {
        bannerTimer = Timer.init(timeInterval: timerInterInterval, target: self, selector: #selector(changeOffset), userInfo: nil, repeats: true)
        
        let mainLoop = RunLoop.main
        mainLoop.add(bannerTimer!, forMode: .common)
    }
    
    @objc func changeOffset() -> Void {
        bannerView.setContentOffset(CGPoint(x: CGFloat(bannerPage.currentPage + 1) * ScreenWidth, y: 0), animated: true)
    }
    
    func stopTiemr() -> Void {
        bannerTimer?.invalidate()
    }
    
    
    

}

extension BannerView {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = scrollView.contentOffset
        let isRight = oldScrollOffset < point.x
        oldScrollOffset = point.x
        if point.x > ScreenWidth * CGFloat(pageCount - 1) + ScreenWidth * 0.5 && (bannerTimer == nil)  {
            bannerPage.currentPage = 0
        } else if point.x > ScreenWidth * CGFloat(pageCount - 1) && (bannerTimer != nil) && isRight {
            bannerPage.currentPage = 0
        } else {
            bannerPage.currentPage = Int((point.x + ScreenWidth * 0.5) / ScreenWidth)
        }
        
        if point.x >= ScreenWidth * CGFloat(pageCount) {
            bannerView.setContentOffset(CGPoint(x: 0, y: 0), animated: false)
        } else if point.x < 0{
            bannerView.setContentOffset(CGPoint(x: point.x + ScreenWidth * CGFloat(pageCount), y: 0), animated: false)
        }
        
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        stopTiemr()
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        createTimer()
    }
}
