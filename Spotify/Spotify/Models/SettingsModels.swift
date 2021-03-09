//
//  SettingsModels.swift
//  Spotify
//
//  Created by 郭丰锐 on 2021/3/9.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}















