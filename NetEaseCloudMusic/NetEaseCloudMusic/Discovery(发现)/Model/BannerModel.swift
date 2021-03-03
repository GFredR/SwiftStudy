//
//  BannerModel.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/3.
//

import Foundation
struct BannerModel: Decodable {
    var code: String
    var banners: [BannerList]
    struct BannerList: Decodable {
        var pic: String
        var targetId: Int
        var adid: String
        var targetType: Int
        var titleColor: String
        var typeTitle: String
        var url: String
        var adurlV2: String
        var exclusive: Bool
        var monitorImpress: String
        var monitorClick: String
        var monitorType: String
        var monitorImpressList: [String]
        var monitorClickList: [String]
        var monitorBlackList: String
        var extMonitor: String
        var extMonitorInfo: String
        var adSource: String
        var adLocation: String
        var encodeId: String
        var program: String
        var event: String
        var video: String
        var dynamicVideoData: String
        var bannerId: String
        var alg: String
        var scm: String
        var requestId: String
        var showAdTag: Bool
        var pid: String
        var showContext: String
        var adDispatchJson: String
        var song: BannerSong
        struct BannerSong: Decodable {
            var name: String
            var id: Int
            var pst: Int
            var t: Int
            var ar: [BannerAr]
            struct BannerAr: Decodable {
                var id: Int
                var name: String
                var tns: [String]
                var ailias: [String]
            }
            var alia: [String]
            var pop: Int
            var st: Int
            var rt: String
            var fee: Int
            var v: Int
            var crbt: String
            var cf: String
            var al: BannerAl
            struct BannerAl: Decodable {
                var id: Int
                var name: String
                var picUrl: String
                var tns: [String]
                var pic_str: String
                var pic: Int16
            }
            var dt: Int
            struct BannerHML: Decodable {
                var br: Int
                var fid: Int
                var size: Int
                var vd: Int
            }
            var h: BannerHML
            var m: BannerHML
            var l: BannerHML
            var a: String
            var cd: String
            var no: Int
            var rtUrl: String
            var ftype: Int
            var rtUrls: [String]
            var djId: Int
            var copyright: Int
            var s_id: Int
            var mark: Int
            var originCoverType: Int
            var originSongSimpleData: String
            var single: Int
            var noCopyrightRcmd: String
            var mv: Int
            var cp: Int
            var rtype: Int
            var rurl: String
            var mst: Int
            var publishTime: Int
            var privilege: BannerPrivilege
            struct BannerPrivilege: Decodable {
                var id: Int
                var fee: Int
                var payed: Int
                var st: Int
                var pl: Int
                var dl: Int
                var sp: Int
                var cp: Int
                var subp: Int
                var cs: Bool
                var maxbr: Int
                var fl: Int
                var toast: Bool
                var flag: Int
                var preSell: Bool
                var playMaxbr: Int
                var downloadMaxbr: Int
                var freeTrialPrivilege: FreeTrial
                struct FreeTrial: Decodable {
                    var resConsumable: Bool
                    var userConsumable: Bool
                }
                var chargeInfoList: [ChargeInfoList]
                struct ChargeInfoList: Decodable {
                    var rate: Int
                    var chargeUrl: String
                    var chargeMessage: String
                    var chargeType: Int
                }
            }
        }
    }
}
