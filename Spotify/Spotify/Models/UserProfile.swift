//
//  UserProfile.swift
//  Spotify
//
//  Created by 郭丰锐 on 2021/3/4.
//

import Foundation

struct UserProfile: Codable {
    let country: String
    let display_name: String
    let email: String
    let explicit_content: [String: Bool]
    let external_urls: [String: String]
//    let followers: [String: Codable?]
    let id: String
    let product: String
    let images: [UserImage]
}

struct UserImage: Codable {
    let url: String
}
//{
//
//    followers =     {
//        href = "<null>";
//        total = 0;
//    };
//    href = "https://api.spotify.com/v1/users/mzncztjlwn0er5fmnzvbrdai1";
//    id = mzncztjlwn0er5fmnzvbrdai1;
//    images =     (
//    );
//    product = open;
//    type = user;
//    uri = "spotify:user:mzncztjlwn0er5fmnzvbrdai1";
//}
