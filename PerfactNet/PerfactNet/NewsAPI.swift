//
//  API.swift
//  PerfactNet
//
//  Created by 郭丰锐 on 2021/1/20.
//

import Foundation
import Moya
//let BaseUrl = "http://v.juhe.cn/toutiao/index?"

enum NewsApi {
    case newsList(type: String, key: String)
    
}
// 补全【MoyaConfig 3：配置TargetType协议可以一次性处理的参数】中没有处理的参数
extension NewsApi: TargetType {
    //1. 每个接口的相对路径
    //请求时的绝对路径是   baseURL + path
    var path: String {
        switch self {
        case let .newsList(type, key):
            
            return "toutiao/index?type=\(type)&key=\(key)"
        }
    }

    //2. 每个接口要使用的请求方式
    var method: Moya.Method {
        switch self {
        case .newsList:
            return .post
        }
    }

    //3. Task是一个枚举值，根据后台需要的数据，选择不同的http task。
    var task: Task {
        var params: [String: Any] = [:]
        switch self {
        case let .newsList(type, key):
            params["type"] = type
            params["key"] = key
        default:
            //不需要传参数的接口走这里
            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
}
