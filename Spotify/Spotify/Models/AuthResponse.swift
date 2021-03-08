//
//  AuthResponse.swift
//  Spotify
//
//  Created by 郭丰锐 on 2021/3/8.
//

import Foundation

struct AuthResponse: Codable {
    let access_token: String
    let expires_in: Int
    let refresh_token: String?
    let scope: String
    let token_type: String
}


