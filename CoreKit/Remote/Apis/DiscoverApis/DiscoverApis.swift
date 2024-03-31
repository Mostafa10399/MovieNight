//
//  DiscoverApis.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public protocol DiscoverApis: RemoteAPI {
    func getNowPlaying(auth: String) async throws -> Movies
    func getUpComing(auth: String) async throws -> Movies
    func getPopular(auth: String) async throws -> Movies
    func getMovieDetails(auth: String, id: Int) async throws -> MovieDetails
    func getMovieCredits(auth: String, id: Int) async throws -> Credits
}
