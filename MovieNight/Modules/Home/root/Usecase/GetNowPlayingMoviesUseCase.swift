//
//  GetNowPlayingMoviesUseCase.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

protocol GetNowPlayingMoviesUseCase {
    var discoverRepository: DiscoverRepository { get }
    func getNowPlayingMovies() async throws -> MovieSectionPresentable?
}

extension GetNowPlayingMoviesUseCase {
     func getNowPlayingMovies() async throws -> MovieSectionPresentable? {
        guard let movies = try await discoverRepository.getNowPlaying() else { return nil }
        let presentableMovies = movies.results.map{ MovieListPresentable($0) }
        if presentableMovies.isEmpty {
            return nil
        } else {
            return MovieSectionPresentable(title: "Now Playing", movies: presentableMovies)
        }
    }
}
