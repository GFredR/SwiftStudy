//
//  APIProvider.swift
//  NetEaseCloudMusic
//
//  Created by 郭丰锐 on 2021/3/11.
//

import Foundation
import Moya
// 首页接口
let APIProvider = MoyaProvider<API>()


enum API {
    case login(parameters:[String:Any]) // 首页上面列表
//    case homePageBelowConten(parameters:[String:Any]) // 首页下面列表
//    case goodDetail(parameters:[String:Any]) // 商品详情
//    case goodCategory(parameters:[String:Any]) //商品类别信息
//    case categoryGoodsList(parameters:[String:Any]) //商品列表

}


// 遵循 TargetType 代理 实现方法
extension API: TargetType {
    //服务器地址
    public var baseURL: URL {
         return URL(string: "http://localhost:3000/")!
    }

    var path: String {
        switch self {
            case .login: return "login/cellphone?"
//            case .homePageBelowConten: return "wxmini/homePageBelowConten"
//            case .goodDetail: return "wxmini/getGoodDetailById"
//            case .goodCategory: return "wxmini/getCategory"
//            case .categoryGoodsList: return "wxmini/getMallGoods"
        }
    }

    var method: Moya.Method {
        return .get
    }
    
    var task: Task {
        var parmeters:[String:Any] = [:]
        switch self {
        case .login(let parameters):
            parmeters = parameters
//        case .homePageBelowConten(let parameters):
//            parmeters = parameters
//        case .goodDetail((let parameters)):
//            parmeters = parameters
//        case .goodCategory(let parameters):
//            parmeters = parameters
//        case .categoryGoodsList(let parameters):
//            parmeters = parameters
        }
        
        return .requestParameters(parameters: parmeters, encoding: URLEncoding.default)
    }
    
    var sampleData: Data {
        
        return "".data(using: String.Encoding.utf8)!
        
    }
    var headers: [String : String]? { return nil }

    //是否显示转圈提示
    var show: Bool {
        return self.show
    }
    
}
