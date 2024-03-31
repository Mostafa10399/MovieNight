//
//  SpyMovieNightDiscoverApiFail.swift
//  CoreKitTests
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

final class SpyMovieNightDiscoverApiFail: DiscoverApis {

    // MARK: - Properties
    
    // MARK: - Methods
    
    func getNowPlaying(auth: String) async throws -> CoreKit.Movies {
        return try await request(SpyDiscoverServiceFail.getNowPlaying(auth: auth))
    }
    
    func getUpComing(auth: String) async throws -> CoreKit.Movies {
        return try await request(SpyDiscoverServiceFail.getUpComing(auth: auth))
    }
    
    func getPopular(auth: String) async throws -> CoreKit.Movies {
        return try await request(SpyDiscoverServiceFail.getPopular(auth: auth))
    }
    
    func getMovieDetails(auth: String, id: Int) async throws -> CoreKit.MovieDetails {
        return try await request(SpyDiscoverServiceFail.getMovieDetails(auth: auth, id: id))
    }
    
    func getMovieCredits(auth: String, id: Int) async throws -> CoreKit.Credits {
        return try await request(SpyDiscoverServiceFail.getMovieCredits(auth: auth, id: id))
    }
    
}

