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
    
    public func getNowPlaying(token: String) async throws -> Movies {
        try await request(DiscoverService.getNowPlaying(token: token))
    }
    
    public func getUpComing(token: String) async throws -> Movies {
        try await request(DiscoverService.getUpComing(token: token))
    }
    
    public func getPopular(token: String) async throws -> Movies {
        try await request(DiscoverService.getUpComing(token: token))
    }
    
}
