//
//  SpyMainDiscoverRepository.swift
//  CoreKitTests
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

class SpyMainDiscoverRepository: DiscoverRepository {
    
    // MARK: - Properties
    
    private let spy: DiscoverApis
    
    // MARK: - Methods
    
    init(spy: DiscoverApis) {
        self.spy = spy
    }
    
    func getNowPlaying() async throws -> Movies? {
        try await spy.getNowPlaying(auth: "")
    }
    
    func getUpComing() async throws -> Movies? {
        try await spy.getUpComing(auth: "")
    }
    
    func getPopular() async throws -> Movies? {
        try await spy.getPopular(auth: "")
    }
    
    func getMovieDetails(id: Int) async throws -> MovieDetails? {
        try await spy.getMovieDetails(auth: "", id: id)
    }
    
    func getMovieCredits(id: Int) async throws -> Credits? {
        try await spy.getMovieCredits(auth: "", id: id)
    }
    
    
    
}
