//
//  DiscoverService.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public enum DiscoverService {
    case getNowPlaying(token: String)
    case getUpComing(token: String)
    case getPopular(token: String)
}

extension DiscoverService: MovieNightService {

    public var mainRoute: String { return "movie/" }
    
    public var requestConfiguration: RequestConfiguration {
        switch self {
        case let .getNowPlaying(token):
            let parameters = ["api_key": token]
            return RequestConfiguration(
                path: mainRoute.appending("now_playing"),
                parameters: parameters,
                encoding: .url)
        case let .getUpComing(token):
            let parameters = ["api_key": token]
            return RequestConfiguration(
                path: mainRoute.appending("upcoming"),
                parameters: parameters,
                encoding: .url)
        case let .getPopular(token):
            let parameters = ["api_key": token]
            return RequestConfiguration(
                path: mainRoute.appending("popular"),
                parameters:  parameters,
                encoding: .url)
        }
    }
}
