//
//  MainDiscoverRepository.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public final class MainDiscoverRepository: DiscoverRepository {
    
    // MARK: - Properties
    
    private let remoteApis: DiscoverApis
    
    // MARK: - Methods
    
    public init(remoteApis: DiscoverApis) {
        self.remoteApis = remoteApis
    }
    
    public func getNowPlaying() async throws -> Movies? {
        guard let auth = Bundle(for: MainDiscoverRepository.self).infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getNowPlaying(auth: auth)
    }
    
    public func getUpComing() async throws -> Movies? {
        guard let auth = Bundle(for: MainDiscoverRepository.self).infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getUpComing(auth: auth)
    }
    
    public func getPopular() async throws -> Movies? {
        guard let auth = Bundle(for: MainDiscoverRepository.self).infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getPopular(auth: auth)
    }
    
    public func getMovieDetails(id: Int) async throws -> MovieDetails? {
        guard let auth = Bundle(for: MainDiscoverRepository.self).infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getMovieDetails(auth: auth, id: id)
    }
    
}
