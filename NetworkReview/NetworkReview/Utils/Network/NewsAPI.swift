//
//  API.swift
//  NetworkReview
//
//  Created by 郭丰锐 on 2021/1/22.
//

import Foundation
import Moya

enum NewsApi {
    case newsList(type: String, key: String)
}

extension NewsApi: TargetType {
    //1. 每个接口的相对路径
    //请求时的绝对路径是   baseURL + path
    var path: String {
        switch self {
        case let .newsList(type, key):
            return "index?type=\(type)&key=\(key)"
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
       
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
}
