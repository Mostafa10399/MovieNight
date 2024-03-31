//
//  MovieNightDiscoverApis.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public final class MovieNightDiscoverApis: DiscoverApis {

    // MARK: - Properties
    
    public init() {
        
    }
    
    // MARK: - Methods
    
    public func getNowPlaying(auth: String) async throws -> Movies {
        try await request(DiscoverService.getNowPlaying(auth: auth))
    }
    
    public func getUpComing(auth: String) async throws -> Movies {
        try await request(DiscoverService.getUpComing(auth: auth))
    }
    
    public func getPopular(auth: String) async throws -> Movies {
        try await request(DiscoverService.getUpComing(auth: auth))
    }
    
    public func getMovieDetails(auth: String, id: Int) async throws -> MovieDetails {
        try await request(DiscoverService.getMovieDetails(auth: auth, id: id))
    }
    
    public func getMovieCredits(auth: String, id: Int) async throws -> Credits {
        try await request(DiscoverService.getMovieCredits(auth: auth, id: id))
    }
}
