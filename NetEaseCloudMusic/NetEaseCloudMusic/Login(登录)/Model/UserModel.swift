//
//  UserModel.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/10.
//

import Foundation
import HandyJSON
struct UserInfoModel: HandyJSON {
    
    
    var loginType: Int?
    var code: Int?
    var account: Account?
    struct Account: HandyJSON {
        var id: Int?
        var userName: String?
        var type: Int?
        var status: Int?
        var whitelistAuthority: Int?
        var createTime: Int?
        var salt: String?
        var tokenVersion: Int?
        var ban: Int?
        var baoyueVersion: Int?
        var donateVersion: Int?
        var vipType: Int?
        var viptypeVersion: Int?
        var anonimousUser: Bool?
        init() {
            
        }
    }
    
    var token: String?
    var profile: Profile?
    struct Profile: HandyJSON {
        var followed: Bool?
        var backgroundUrl: String?
        var detailDescription: String?
        var userType: Int?
        var description: String?
        var backgroundImgId: Int?
        var avatarUrl: String?
        var defaultAvatar: Bool?
        var province: Int?
        var djStatus: Int?
//        var experts: [String: String]
        var vipType: Int?
        var gender: Int?
        var accountStatus: Int?
        var avatarImgId: Int?
        var birthday: Int?
        var nickname: String?
        var city: Int?
        var mutual: Bool?
        var remarkName: String?
        var expertTags: String?
        var authStatus: Int?
        var userId: Int?
        var backgroundImgIdStr: String?
        var avatarImgIdStr: String?
        var signature: String?
        var authority: Int?
        var avatarImgId_str: String?
        var followeds: Int?
        var follows: Int?
        var eventCount: Int?
        var avatarDetail: String?
        var playlistCount: Int?
        var playlistBeSubscribedCount: Int?
        init() {
            
        }
    }
    var bindings: [Binding]?
    struct Binding: HandyJSON {
        var refreshTime: Int?
        var tokenJsonStr: String?
        var expiresIn: Int?
        var bindingTime: Int?
        var url: String?
        var userId: Int?
        var expired: Bool?
        var id: Int16?
        var type: Int?
        init() {
            
        }
    }
    var cookie: String?

    init() {
    }
}
