//
//  BannerAPI.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/4.
//

import Foundation
import Moya

enum BannerAPI {
    case bannerInfo(type: String)
    
}

extension BannerAPI: TargetType {
    //1. 每个接口的相对路径
    //请求时的绝对路径是   baseURL + path
    var path: String {
        switch self {
        case let .bannerInfo(type):
            
            return "banner?type=\(type)"
        }
    }

    //2. 每个接口要使用的请求方式
    var method: Moya.Method {
        switch self {
        case .bannerInfo:
            return .get
        }
    }

    //3. Task是一个枚举值，根据后台需要的数据，选择不同的http task。
    var task: Task {
        var params: [String: Any] = [:]
        switch self {
        case let .bannerInfo(type):
            params["type"] = type
//        default:
//            //不需要传参数的接口走这里
//            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
}
