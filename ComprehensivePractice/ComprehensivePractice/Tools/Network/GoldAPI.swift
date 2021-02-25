//
//  GoldAPI.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/23.
//

import Foundation
import Moya
//efca0ba22b68ee905ea3cd9741b79042
enum GoldAPI {
    case goldenMessage(key: String, v: String)
}
extension GoldAPI: TargetType {
    //1. 每个接口的相对路径
    //请求时的绝对路径是   baseURL + path
    var path: String {
        switch self {
        case let .goldenMessage(key, v):
            
            return ":8080/finance/gold/shgold?key=\(key)&v\(v)"
        }
    }

    //2. 每个接口要使用的请求方式
    var method: Moya.Method {
        switch self {
        case .goldenMessage:
            return .get
        }
    }

    //3. Task是一个枚举值，根据后台需要的数据，选择不同的http task。
    var task: Task {
        var params: [String: Any] = [:]
        switch self {
        case let .goldenMessage(key, v):
            params["key"] = key
            params["v"] = v
//        default:
//            //不需要传参数的接口走这里
//            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
}
