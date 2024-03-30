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
//        guard let token = Bundle.main.infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getNowPlaying(token: "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI4OTM4NjRkMDI0N2Y0YjA2NzA4NmY0ZWExYzBiNTI4OSIsInN1YiI6IjYxYWJjZjFiYWE2NTllMDA0MDQzOGFlZiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.MaBa0n0i7Zaz-42cito5Ks-AwNDsyVqxGNCwuyYZPXo")
    }
    
    public func getUpComing() async throws -> Movies? {
        guard let token = Bundle.main.infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getUpComing(token: token)
    }
    
    public func getPopular() async throws -> Movies? {
        guard let token = Bundle.main.infoDictionary?["API_KEY"] as? String else { return nil }
        return try await remoteApis.getPopular(token: token)
    }
    
}
