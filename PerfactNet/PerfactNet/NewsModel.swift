//
//  NewsModel.swift
//  PerfactNet
//
//  Created by 郭丰锐 on 2021/1/20.
//

import Foundation
struct NewsModel: Codable {
    var reason: String
    var result: NewsResult
    struct NewsResult: Codable {
        var stat: String
        var data: [NewsList]
        struct NewsList: Codable {
            var uniquekey: String
            var title: String
            var date: String
            var category: String
            var author_name: String
            var url: String
            var thumbnail_pic_s: String
            var thumbnail_pic_s02: String
            var thumbnail_pic_s03: String
        }
    }
}





//extension NewsModel {
//    var generalCode: String {
//        return reason
//    }
//
////    var generalMessage: String {
////        return data.message
////    }
//}
