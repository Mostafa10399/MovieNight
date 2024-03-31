//
//  DiscoverRepository.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public protocol DiscoverRepository {
    func getNowPlaying() async throws -> Movies?
    func getUpComing() async throws -> Movies?
    func getPopular() async throws -> Movies?
    func getMovieDetails(id: Int) async throws -> MovieDetails?
    func getMovieCredits(id: Int) async throws -> Credits?
}
