//
//  LotteryModel.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/25.
//

import Foundation
struct LotteryModel: Decodable {
    var reason: String
    var result: [LotteryResult]
    
    struct LotteryResult: Decodable {
        var lottery_id: String
        var lottery_name: String
        var lottery_res: String
        var lottery_no: String
        var lottery_date: String
        var lottery_exdate: String
        var lottery_sale_amount: String
        var lottery_pool_amount: String
        var lottery_prize: [LotteryList]
        
        struct LotteryList: Decodable {
            var prize_name: String
            var prize_num: String
            var prize_amount: String
            var prize_require: String
        }
    }
}
