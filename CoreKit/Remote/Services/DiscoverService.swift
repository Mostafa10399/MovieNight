//
//  DiscoverService.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public enum DiscoverService {
    case getNowPlaying(auth: String)
    case getUpComing(auth: String)
    case getPopular(auth: String)
    case getMovieDetails(auth: String, id: Int)
}

extension DiscoverService: MovieNightService {

    public var mainRoute: String { return "movie/" }
    
    public var requestConfiguration: RequestConfiguration {
        switch self {
        case let .getNowPlaying(auth):
            let parameters = ["api_key": auth]
            return RequestConfiguration(
                path: mainRoute.appending("now_playing"),
                parameters: parameters,
                encoding: .url)
        case let .getUpComing(auth):
            let parameters = ["api_key": auth]
            return RequestConfiguration(
                path: mainRoute.appending("upcoming"),
                parameters: parameters,
                encoding: .url)
        case let .getPopular(auth):
            let parameters = ["api_key": auth]
            return RequestConfiguration(
                path: mainRoute.appending("popular"),
                parameters:  parameters,
                encoding: .url)
        case let .getMovieDetails(auth, id):
            let parameters = ["api_key": auth]
            return RequestConfiguration(
                path: mainRoute.appending("\(id)"),
                parameters:  parameters,
                encoding: .url)
        }
    }
}
