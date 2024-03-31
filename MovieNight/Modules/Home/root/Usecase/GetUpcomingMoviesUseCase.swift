//
//  GetUpcomingMoviesUseCase.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

public protocol GetUpcomingMoviesUseCase {
    var discoverRepository: DiscoverRepository { get }
    func getUpcomingMovies() async throws -> MovieSectionPresentable?
}

extension GetUpcomingMoviesUseCase {
    public func getUpcomingMovies() async throws -> MovieSectionPresentable? {
        guard let movies = try await discoverRepository.getUpComing() else { return nil }
        let presentableMovies = movies.results.map{ MovieListPresentable($0) }
        if presentableMovies.isEmpty {
            return nil
        } else {
            return MovieSectionPresentable(title: "Up Coming", movies: presentableMovies)
        }
    }
}
