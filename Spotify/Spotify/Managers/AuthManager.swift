//
//  AuthManager.swift
//  Spotify
//
//  Created by 郭丰锐 on 2021/3/4.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    struct Contants {
        static let cilentID = "f2aaf755f8f042b4a3f99865ccb9161b"
        static let clientSecret = "cbfa9f71b5e54ec786416054f5be3344"
    }
    
    private init() {}
    
    public var signInURL: URL? {
        let scopes = "user-read-private"
        let base = "https://accounts.spotify.com/authorize"
        let redirectURI = "https://www.iosacademy.io"
        let string = "\(base)?response_type=code&client_id=\(Contants.cilentID)&scope=\(scopes)&redirect_uri=\(redirectURI)&show_dialog=TRUE"
        return URL(string: string)
    }
    
    var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    private var refreshToken: String? {
        return nil
    }
    
    private var tokenExpirationDate: Date? {
        return nil
    }
    
    private var shouldRefreshToken: Bool {
        return false
    }
    
    public func exchangeCodeForToken(code: String, completion: @escaping ((Bool) -> Void)) -> Void {
        
    }
    
    public func refreshAccessToken() -> Void {
        
    }
    
    private func cacheToken() -> Void {
        
    }
}
