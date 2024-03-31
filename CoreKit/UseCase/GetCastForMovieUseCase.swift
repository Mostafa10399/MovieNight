//
//  GetCastForMovieUseCase.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation

public protocol GetCastForMovieUseCase {
    var discoverRepository: DiscoverRepository { get }
    func getMovieCast(by id: Int) async throws -> [CastMemberPresentable]?
}

extension GetCastForMovieUseCase {
    public func getMovieCast(by id: Int) async throws -> [CastMemberPresentable]? {
        guard let cast = try await discoverRepository.getMovieCredits(id: id) else { return nil }
        return cast.cast.map { CastMemberPresentable($0) }
    }
}
