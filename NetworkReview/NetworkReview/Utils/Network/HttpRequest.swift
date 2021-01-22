//
//  HttpRequest.swift
//  NetworkReview
//
//  Created by 郭丰锐 on 2021/1/22.
//

import Foundation
import Moya
import MBProgressHUD
/// 使用moya的请求封装
///
/// - Parameters:
///   - target: TargetType里的枚举值
///   -cache: 是否缓存
///   -cacheHandle: 需要单独处理缓存的数据时使用，（默认为空，使用success处理缓存数据）
///   - success: 成功的回调
///   - error: 连接服务器成功但是数据获取失败
///   - failure: 连接服务器失败
public class HttpRequest {
    public class func loadData<T: TargetType, D: Decodable>(target: T, model: D.Type?, cache: ((D?) -> Void)? = nil, success: @escaping((D?) -> Void), failure: ((Int?, String) -> Void)? ) -> Void {
        let provider = MoyaProvider<T>(plugins: [
            RequestHandlingPlugin()
        ])
        
        //如果需要读取缓存，则优先读取缓存内容
        if let cache = cache, let data = GSaveFiles.read(path: target.path) {
            
            let model = try? JSONDecoder().decode(D.self, from: data)
            cache(model)
        } else {
            //读取缓存速度较快，无需显示hud；仅从网络加载数据时，显示hud。
            GFRProgressHUD.show()
        }
        
        provider.request(target) { (result) in
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
            GFRAlert.show(type: .error, text: message)
            failure?(stateCode ,message)
        }
        
        //登录弹窗 - 弹出是否需要登录的窗口
        func alertLogin(_ title: String?) {
            //TODO: 跳转到登录页的操作：
        }
    }
}
