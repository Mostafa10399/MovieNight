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
        guard let token = Bundle(for: MainDiscoverRepository.self).infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getNowPlaying(token: token)
    }
    
    public func getUpComing() async throws -> Movies? {
        guard let token = Bundle(for: MainDiscoverRepository.self).infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getUpComing(token: token)
    }
    
    public func getPopular() async throws -> Movies? {
        guard let token = Bundle(for: MainDiscoverRepository.self).infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getPopular(token: token)
    }
    
}
