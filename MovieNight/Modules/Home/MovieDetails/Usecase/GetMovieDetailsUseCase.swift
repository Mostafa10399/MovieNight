//
//  GetMovieDetailsUseCase.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

protocol GetMovieDetailsUseCase {
    var discoverRepository: DiscoverRepository { get }
    func getMovieDetails(by id: Int) async throws -> MovieDetailsPresentable?
}

extension GetMovieDetailsUseCase {
     func getMovieDetails(by id: Int) async throws -> MovieDetailsPresentable? {
        guard let movie = try await discoverRepository.getMovieDetails(id: id) else { return nil }
        return MovieDetailsPresentable(movie)
    }
}
