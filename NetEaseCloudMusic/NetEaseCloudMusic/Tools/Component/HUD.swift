//
//  HUD.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/1.
//

import Foundation
import MBProgressHUD

class GFRAlert: NSObject {
    enum AlertType {
        case success
        case info
        case error
        case warning
    }
    class func show(type: AlertType, text: String, view: UIView) -> Void {
//        if let window = UIApplication.shared.delegate?.window {
            var image: UIImage
            switch type {
            case .success:
                if #available(iOS 13.0, *) {
                    image = UIImage(systemName: "checkmark")!
                } else {
                    image = #imageLiteral(resourceName: "Alert_success")
                }
            case .info:
                if #available(iOS 13.0, *) {
                    image = UIImage(systemName: "burn")!
                } else {
                    image = #imageLiteral(resourceName: "Alert_success")
                }
            case .error:
                if #available(iOS 13.0, *) {
                    image = UIImage(systemName: "xmark")!
                } else {
                    image = #imageLiteral(resourceName: "Alert_success")
                }
            case .warning:
                image = #imageLiteral(resourceName: "Alert_success")
            }
            let hud = MBProgressHUD.showAdded(to: view, animated: true)
            hud.backgroundColor = UIColor.gray.withAlphaComponent(0.2)
            hud.mode = .customView
            hud.customView = UIImageView(image: image)
            hud.label.text = text
            hud.hide(animated: true, afterDelay: 1.2)
//        }
    }
}

class GFRProgressHUD {
    class func show(view: UIView) -> Void {
        MBProgressHUD.showAdded(to: view, animated: true)
    }
    
    class func hide(view: UIView) -> Void {
        MBProgressHUD.hide(for: view, animated: true)
    }
}
