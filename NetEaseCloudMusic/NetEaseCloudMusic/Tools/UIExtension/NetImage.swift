//
//  NetImage.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/1.
//

import UIKit
import Kingfisher
public extension UIImageView {
    func setNetImage(url: String) -> Void {
        let imgUrl = URL(string: url)
        
        self.kf.setImage(with: imgUrl, placeholder: UIImage(named: "loading"), options: [.fromMemoryCacheOrRefresh]) { (result, error) in
            if (result != 0) {
                print(error)
            } else {
                print(result)
            }
        }
    }
}
