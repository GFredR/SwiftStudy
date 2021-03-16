//
//  NewReleasesResponse.swift
//  Spotify
//
//  Created by 郭丰锐 on 2021/3/16.
//

import Foundation
struct NewReleasesResponse: Codable {
    let albums: AlbumsResponse
}

struct AlbumsResponse: Codable {
    let items: [Album]
}

struct Album: Codable {
    let album_type: String
    let available_markets: [String]
    let id: String
    let images: [UserImage]
    let name: String
    let release_date: String
    let total_tracks: Int
    let artists: [Artist]
}

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
