//
//  NewsModel.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/3.
//

import Foundation

struct NewsModel: Decodable {
    var reason: String
    var result: NewsResult
    struct NewsResult: Decodable {
        var stat: String
        var data: [NewsData]
        struct NewsData: Decodable {
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
