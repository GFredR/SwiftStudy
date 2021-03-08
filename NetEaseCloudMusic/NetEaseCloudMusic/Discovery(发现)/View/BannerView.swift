//
//  BannerView.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/4.
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

            // 以下是kingfisher的用法
            
            if i == imgArr.count {

                imgView.setNetImage(url: imgArr[0])
                   

            } else {
                imgView.setNetImage(url: imgArr[i])
                  
            }
            scrollView.addSubview(imgView)
            
        }
        
        createTimer()
        
        return scrollView
    }()
    
    lazy var scrollLabel: UILabel = {
        let titleLabel: UILabel = UILabel()
        titleLabel.frame = CGRect(x: 0, y: bannerView.bottom - 30, width: ScreenWidth, height: 30)
        titleLabel.backgroundColor = .lightGray
        titleLabel.textColor = .white
        titleLabel.font = .systemFont(ofSize: 15)
        return titleLabel
    }()
    
    lazy var bannerPage: UIPageControl = {
        let pageControl: UIPageControl = UIPageControl()
        pageControl.frame = CGRect(x: bannerView.right - 300, y: scrollLabel.bottom - 38, width: 300, height: 50)
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
        
        return pageControl
    }()
    
    var bannerTimer: Timer?
    
    lazy var imgArr = [String]()
//        Array<String> = {
//        let arr = [""]
//        return arr
//    }()
    
    lazy var titleArr: Array<String> = {
        let arr = ["今日金价","今日汇率","彩票开奖"]
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
        
//        self.addSubview(bannerView)
//        self.addSubview(scrollLabel)
//        self.addSubview(bannerPage)
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
//            scrollLabel.text = titleArr[0]
        } else if point.x > ScreenWidth * CGFloat(pageCount - 1) && (bannerTimer != nil) && isRight {
            bannerPage.currentPage = 0
//            scrollLabel.text = titleArr[0]
        } else {
            bannerPage.currentPage = Int((point.x + ScreenWidth * 0.5) / ScreenWidth)
//            scrollLabel.text = titleArr[Int((point.x + ScreenWidth * 0.5) / ScreenWidth)]
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


