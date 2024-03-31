//
//  GetPopularMoviesUseCase.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

public protocol GetPopularMoviesUseCase {
    var discoverRepository: DiscoverRepository { get }
    func getPopularMovies() async throws -> MovieSectionPresentable?
}

extension GetPopularMoviesUseCase {
    public func getPopularMovies() async throws -> MovieSectionPresentable? {
        guard let movies = try await discoverRepository.getPopular() else { return nil }
        let presentableMovies = movies.results.map{ MovieListPresentable($0) }
        if presentableMovies.isEmpty {
            return nil
        } else {
            return MovieSectionPresentable(title: "Popular", movies: presentableMovies)
        }
    }
}
