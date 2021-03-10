//
//  UserModel.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/10.
//

import Foundation

struct UserInfoModel: Decodable {
    var loginType: String
    var code: String
    var account: Account
    var token: String
    var profile: Profile
    var bindings: [Binding]
    var cookie: String
    struct Account: Decodable {
        var id: Int
        var userName: String
        var type: Int
        var status: Int
        var whitelistAuthority: Int
        var createTime: Int16
        var salt: String
        var tokenVersion: Int
        var ban: Int
        var baoyueVersion: Int
        var donateVersion: Int
        var vipType: Int
        var viptypeVersion: Int16
        var anonimousUser: Bool
    }
    
    struct Profile: Decodable {
        var followed: Bool
        var backgroundUrl: String
        var detailDescription: String
        var userType: Int
        var description: String
        var backgroundImgId: Int16
        var avatarUrl: String
        var defaultAvatar: Bool
        var province: Int
        var djStatus: Int
        var experts: [String: String]
        var vipType: Int
        var gender: Int
        var accountStatus: Int
        var avatarImgId: Int16
        var birthday: Int16
        var nickname: String
        var city: Int
        var mutual: Bool
        var remarkName: String
        var expertTags: String
        var authStatus: Int
        var userId: Int
        var backgroundImgIdStr: String
        var avatarImgIdStr: String
        var signature: String
        var authority: Int
        var avatarImgId_str: String
        var followeds: Int
        var follows: Int
        var eventCount: Int
        var avatarDetail: String
        var playlistCount: Int
        var playlistBeSubscribedCount: Int
    }
    
    struct Binding: Decodable {
        var refreshTime: Int
        var tokenJsonStr: String
        var expiresIn: Int
        var bindingTime: Int
        var url: String
        var userId: Int
        var expired: Bool
        var id: Int16
        var type: Int
    }
    
}
