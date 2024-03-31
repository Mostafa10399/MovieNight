//
//  GetNowPlayingMoviesUseCase.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 30/03/2024.
//

import Foundation

public protocol GetNowPlayingMoviesUseCase {
    var discoverRepository: DiscoverRepository { get }
    func getNowPlayingMovies() async throws -> MovieSectionPresentable?
}

extension GetNowPlayingMoviesUseCase {
    public func getNowPlayingMovies() async throws -> MovieSectionPresentable? {
        guard let movies = try await discoverRepository.getNowPlaying() else { return nil }
        let presentableMovies = movies.results.map{ MovieListPresentable($0) }
        if presentableMovies.isEmpty {
            return nil
        } else {
            return MovieSectionPresentable(title: "Now Playing", movies: presentableMovies)
        }
    }
}
