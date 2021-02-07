//
//  HttpRequest.swift
//  PerfactNet
//
//  Created by 郭丰锐 on 2021/1/21.
//

import Foundation
import Moya

public class HttpRequest {
    /// 使用moya的请求封装
    ///
    /// - Parameters:
    ///   - target: TargetType里的枚举值
    ///   - model: model类型
    ///   - cache: 需要单独处理缓存的数据时使用
    ///   - success: 成功的回调
    ///   - error: 连接服务器成功但是数据获取失败
    ///   - failure: 连接服务器失败
    public class func loadData<T: TargetType, D: Decodable>(target: T, model: D.Type?, cache: ((D?) -> Void)? = nil, success: @escaping((D?) -> Void), failure: ((Int?, String) ->Void)?) {
        let provider = MoyaProvider<T>(plugins: [
            RequestHandlingPlugin(),
//            networkLoggerPlugin
            ])
        //如果需要读取缓存，则优先读取缓存内容
        if let cache = cache, let data = GSaveFiles.read(path: target.path) {
            let model = try? JSONDecoder().decode(D.self, from: data)
            cache(model)
        }else {
            //读取缓存速度较快，无需显示hud；仅从网络加载数据时，显示hud。
            GFRProgressHUD.show()
        }
        
        provider.request(target) { result in
            GFRProgressHUD.hide()
            switch result {
            case let .success(response):
                let model = try? response.map(D.self)
                success(model)
            case let .failure(error):
                let statusCode = error.response?.statusCode ?? 0
                let errorCode = "请求出错，错误码：" + String(statusCode)
                failureHandle(failure: failure, stateCode: statusCode, message: error.errorDescription ?? errorCode)
            }
        }
        
        //错误处理 - 弹出错误信息
        func failureHandle(failure: ((Int?, String) ->Void)? , stateCode: Int?, message: String) {
//            Alert.show(type: .error, text: message)
            failure?(stateCode ,message)
        }
        
    }

    ///打印日志
//    static let networkLoggerPlugin = NetworkLoggerPlugin.Configuration.init(formatter: { data -> String in
//        return String(data: data, encoding: .utf8) ?? "", output: <#T##NetworkLoggerPlugin.Configuration.OutputType##NetworkLoggerPlugin.Configuration.OutputType##(TargetType, [String]) -> Void#>, logOptions: <#T##NetworkLoggerPlugin.Configuration.LogOptions#>)
//        NetworkLoggerPlugin(va)
//        NetworkLoggerPlugin(verbose: true, cURL: true, requestDataFormatter: { data -> String in
//        return String(data: data, encoding: .utf8) ?? ""
//    }) { data -> (Data) in
//        do {
//            let dataAsJSON = try JSONSerialization.jsonObject(with: data)
//            let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
//            return prettyData
//        } catch {
//            return data
//        }
//    }
}
