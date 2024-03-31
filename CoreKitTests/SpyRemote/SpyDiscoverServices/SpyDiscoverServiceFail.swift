//
//  SpyDiscoverServiceFail.swift
//  CoreKitTests
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import CoreKit
import Foundation

enum SpyDiscoverServiceFail {
    case getNowPlaying(auth: String)
    case getUpComing(auth: String)
    case getPopular(auth: String)
    case getMovieDetails(auth: String, id: Int)
    case getMovieCredits(auth: String, id: Int)
}

extension SpyDiscoverServiceFail: RemoteService {
    var baseUrl: String {
        switch self {
        default:
            return "Mock" 
        }
    }
    
    var requestConfiguration: RequestConfiguration {
        switch self {
        default:
            RequestConfiguration(path: "")
        }
    }
}
