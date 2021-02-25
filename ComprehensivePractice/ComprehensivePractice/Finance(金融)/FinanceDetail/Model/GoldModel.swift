//
//  GoldModel.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/23.
//

import Foundation
struct GoldModel: Decodable {
    var resultcode: String
    var reason: String
    var goldList: [GoldList]
    struct GoldList: Decodable {
        var num: GoldInfo
        struct GoldInfo: Decodable {
            var variety: String        /*品种*/
            var latestpri: String      /*最新价*/
            var openpri: String       /*开盘价*/
            var maxpri: String        /*最高价*/
            var minpri: String        /*最低价*/
            var limit: String        /*涨跌幅*/
            var yespri: String        /*昨收价*/
            var totalvol: String    /*总成交量*/
            var time: String    /*更新时间*/
        }
    }
}
