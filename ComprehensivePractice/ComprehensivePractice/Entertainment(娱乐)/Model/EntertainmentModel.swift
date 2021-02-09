//
//  EntertainmentModel.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/9.
//

import Foundation
struct EntertainmentModel: Decodable {
    var error_code: Int
    var reason: String
    var result: EntertainmentData
    struct EntertainmentData: Decodable {
        var data: [EntertainmentList]
        struct EntertainmentList: Decodable {
            var content: String
            var hashId: String
//            var unixtime: Timer
            var updatetime: String
        }
    }
    
}
