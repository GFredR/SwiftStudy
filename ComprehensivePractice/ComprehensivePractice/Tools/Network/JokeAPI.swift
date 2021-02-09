//
//  JokeAPI.swift
//  ComprehensivePractice
//
//  Created by 郭丰锐 on 2021/2/9.
//

import Foundation
import Moya
enum JokeAPI {
    case jokeList(page: Int, pageSize: Int, key: String)
}
extension JokeAPI: TargetType {
    //1. 每个接口的相对路径
    //请求时的绝对路径是   baseURL + path
    var path: String {
        switch self {
        case let .jokeList(page, pageSize, key):
            
            return "joke/content/text.php?page=\(page)&key=\(key)&pagesize\(pageSize)"
        }
    }

    //2. 每个接口要使用的请求方式
    var method: Moya.Method {
        switch self {
        case .jokeList:
            return .get
        }
    }

    //3. Task是一个枚举值，根据后台需要的数据，选择不同的http task。
    var task: Task {
        var params: [String: Any] = [:]
        switch self {
        case let .jokeList(page, pageSize, key):
            params["page"] = page
            params["pagesize"] = pageSize
            params["key"] = key
//        default:
//            //不需要传参数的接口走这里
//            return .requestPlain
        }
        return .requestParameters(parameters: params, encoding: URLEncoding.default)
    }
    
}
