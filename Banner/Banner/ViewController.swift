//
//  ViewController.swift
//  Banner
//
//  Created by 郭丰锐 on 2021/1/31.
//

import UIKit
import Kingfisher
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height / 4
//let a: Int64 = 9223372036854775807



class ViewController: UIViewController, UIScrollViewDelegate {
    lazy var bannerView: UIScrollView = {
        let scrollView: UIScrollView = UIScrollView()
        scrollView.frame = CGRect(x: 0, y: 0, width: ScreenWidth, height: ScreenHeight)
        scrollView.contentSize = CGSize(width: CGFloat((imgArr.count + 1)) * ScreenWidth, height: 0)
        scrollView.isPagingEnabled = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = self
        for i in 0..<(imgArr.count + 1) {
            let imgView = UIImageView(frame: CGRect(x: CGFloat(i) * ScreenWidth, y: 0, width: ScreenWidth, height: ScreenHeight))
            if i == imgArr.count {
                imgView.kf.setImage(with: URL(string: imgArr[0]))
                
                imgView.kf.setImage(with: URL(string: imgArr[0]), placeholder: UIImage(named: "1"), options: [KingfisherOptionsInfoItem.fromMemoryCacheOrRefresh]) { (result, error) in
                    if (result != 0) {
                        print(error)
                    } else {
                        print(result)
                    }
                    
                }

            } else {
                imgView.kf.setImage(with: URL(string: imgArr[i]), placeholder: UIImage(named: "1"), options: [KingfisherOptionsInfoItem.fromMemoryCacheOrRefresh]) { (result, error) in
                    if (result != 0) {
                        print(error)
                    } else {
                        print(result)
                    }
                    
                }
            }
            scrollView.addSubview(imgView)
//            imgView.addSubview(bannerPage)
        }
        
        createTimer()
        
        return scrollView
    }()
    
    lazy var bannerPage: UIPageControl = {
        let pageControl: UIPageControl = UIPageControl()
        pageControl.frame = CGRect(x: ScreenWidth - 150, y: ScreenHeight - 80, width: 200, height: 100)
        pageControl.pageIndicatorTintColor = .white
        pageControl.currentPageIndicatorTintColor = .orange
        pageControl.numberOfPages = pageCount
        pageControl.currentPage = 0
        
        return pageControl
    }()
    
    var bannerTimer: Timer?
    
    lazy var imgArr: Array<String> = {
        let arr = ["https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.mp.itc.cn%2Fupload%2F20170525%2Fe69c89b503784e6e87f935b79bcdbc97_th.jpg&refer=http%3A%2F%2Fimg.mp.itc.cn&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1614756966&t=725f7891a5fc26d93ce949256d9ed9e3","https://pic.rmb.bdstatic.com/79360353dd34cc12cfb4eec7705a04c0.jpeg","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fp3.music.126.net%2Fqqg-4aKh-CU0suX0de8Pkg%3D%3D%2F2903810209476180.jpg%3Fparam%3D640y300&refer=http%3A%2F%2Fp3.music.126.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1614757032&t=0473e5c764b79b91b073e8893dff35b5","https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fi0.hdslb.com%2Fbfs%2Farchive%2F4152d610f4ecd85e09dd73d2bc29d7534a58c4a3.jpg&refer=http%3A%2F%2Fi0.hdslb.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1614760562&t=965dc692a0519a98d8fa4efd16928580"]
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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(bannerView)
        view.addSubview(bannerPage)
//        print("max value: \(Int64.max)")
        // Do any additional setup after loading the view.
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

extension ViewController {
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
