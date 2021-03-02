//
//  BaseTabBarController.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/1.
//

import UIKit

class BaseTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
//            let version = UIDevice.current.systemVersion
//            if Double(version) ?? 0.0 >= 13.0 {
                setTabBarItemStyle()
//            }
        } else {
            setBarStyle()
        }
        // Do any additional setup after loading the view.
    }
    

    

}
extension BaseTabBarController {
    
    func setTabBarItemStyle() -> Void {
        
        let appearance = UITabBar.appearance()
        appearance.tintColor = UIColor(red: 185 / 255.0, green: 63 / 255.0, blue: 57 / 255.0, alpha: 1)
        
        
    }
    func setBarStyle() -> Void {
        for item in self.tabBar.items ?? [] {
            item.selectedImage = item.selectedImage?.withRenderingMode(.alwaysOriginal)
            
            item.image = item.image?.withRenderingMode(.alwaysOriginal)
            //设置tabbar文字选中颜色
            
            
            item.setBadgeTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor(red: 213 / 255.0, green: 89 / 255.0, blue: 75 / 255.0, alpha: 1)
            ], for: UIControl.State.selected)
            tabBar.tintColor = UIColor(red: 185 / 255.0, green: 63 / 255.0, blue: 57 / 255.0, alpha: 1)
        }
    }
    
}
