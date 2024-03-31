//
//  GetCastForMovieUseCase.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

 protocol GetCastForMovieUseCase {
    var discoverRepository: DiscoverRepository { get }
    func getMovieCast(by id: Int) async throws -> [CastMemberPresentable]?
}

extension GetCastForMovieUseCase {
     func getMovieCast(by id: Int) async throws -> [CastMemberPresentable]? {
        guard let cast = try await discoverRepository.getMovieCredits(id: id) else { return nil }
        return cast.cast.map { CastMemberPresentable($0) }
    }
}
