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
            return RequestConfiguration(
                path: mainRoute.appending("now_playing"),
                headers: [HTTPHeader(name: "Authorization", value: "Bearer \(token)")])
        case let .getUpComing(token):
            return RequestConfiguration(
                path: mainRoute.appending("upcoming"),
                headers: [HTTPHeader(name: "Authorization", value: "Bearer \(token)")])
        case let .getPopular(token):
            return RequestConfiguration(
                path: mainRoute.appending("popular"),
                headers: [HTTPHeader(name: "Authorization", value: "Bearer \(token)")])
        }
    }
}
