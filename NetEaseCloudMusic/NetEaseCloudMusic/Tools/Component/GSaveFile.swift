//
//  GSaveFile.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/1.
//

import Foundation
class GSaveFiles {
    class func save(path: String, data: Data) {
        let pathURL = handlePathUrl(path)
        //拿到一个本地文件的URL
        let manager = FileManager.default
        var url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        url?.appendPathComponent("cache/")
        if let urlStr = url?.absoluteString, manager.isExecutableFile(atPath: urlStr) == false {
            try? manager.createDirectory(at: url!, withIntermediateDirectories: true, attributes: nil)
        }
        url?.appendPathComponent(pathURL)
        do {
            try data.write(to: url!)
            print("保存到本地\(pathURL)")
        } catch {
            print("保存到本地文件失败")
        }
    }
    
    class func read(path: String) -> Data? {
        let pathURL = handlePathUrl(path)
        let manager = FileManager.default
        var url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        url?.appendPathComponent("cache/\(pathURL)")
        if let dataRead = try? Data(contentsOf: url!) {
             print("读取本地文件成功")
            return dataRead
        } else {
            print("文件不存在，读取本地文件失败")
        }
        return nil
    }
    
    func clearCache() -> Void {
        let manager = FileManager.default
        var url = manager.urls(for: .documentDirectory, in: .userDomainMask).first
        url?.appendPathComponent("cache")
        do {
            try? manager.removeItem(at: url!)
        }
    }
    
    class func handlePathUrl(_ url: String) -> String {
        return url.replacingOccurrences(of: "/", with: "")
    }
}
