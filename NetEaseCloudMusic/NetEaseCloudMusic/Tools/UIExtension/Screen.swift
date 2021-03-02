//
//  Screen.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/1.
//

import UIKit
let ScreenWidth = UIScreen.main.bounds.size.width
let ScreenHeight = UIScreen.main.bounds.size.height
//状态栏高度
let StatusBarHeight = UIApplication.shared.statusBarFrame.size.height
//导航栏高度
let NavHeight = StatusBarHeight == 20 ? 64 : 84

extension UIView {
    public var width: CGFloat {
        return self.frame.size.width
    }
    
    public var height: CGFloat {
        return self.frame.size.height
    }
    
    public var top: CGFloat {
        return self.frame.origin.y
    }
    
    public var bottom: CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    
    public var left: CGFloat {
        return self.frame.origin.x
    }
    
    public var right: CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }
}
