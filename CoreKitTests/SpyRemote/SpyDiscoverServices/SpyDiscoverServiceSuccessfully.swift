//
//  SpyDiscoverServiceSuccessfully.swift
//  CoreKitTests
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import CoreKit
import Foundation

 enum SpyDiscoverServiceSuccessfully {
    case getNowPlaying(auth: String)
    case getUpComing(auth: String)
    case getPopular(auth: String)
    case getMovieDetails(auth: String, id: Int)
    case getMovieCredits(auth: String, id: Int)
}

extension SpyDiscoverServiceSuccessfully: RemoteService {
     var baseUrl: String {
        switch self {
        case .getNowPlaying(_):
            return "Movies"
        case .getUpComing(_):
            return "Movies"
        case .getPopular(_):
            return "Movies"
        case .getMovieDetails(_, _):
            return "MovieDetails"
        case .getMovieCredits(_, _):
            return "Credits"
        }
    }
    
    var requestConfiguration: RequestConfiguration {
        switch self {
        default:
            RequestConfiguration(path: "")
        }
    }    
}
