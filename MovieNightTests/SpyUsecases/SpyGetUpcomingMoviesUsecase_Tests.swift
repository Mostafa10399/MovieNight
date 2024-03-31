//
//  SpyGetUpcomingMoviesUsecase_Tests.swift
//  MovieNightTests
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import XCTest
import CoreKit
//@testable import CoreKitTests
@testable import MovieNight

final class SpyGetUpcomingMoviesUsecase_Tests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
//    private func makeSutForSuccess() -> GetUpcomingMoviesUseCase {
//        SpyGetUpcomingMoviesUseCase(discoverRepository:  SpyMainDiscoverRepository(spy: SpyMovieNightDiscoverApiSuccess()))
//    }
//    
//    private func makeSutForFail() -> GetUpcomingMoviesUseCase {
//        SpyGetUpcomingMoviesUseCase(discoverRepository:  SpyMainDiscoverRepository(spy: SpyMovieNightDiscoverApiFail()))
//    }
//    
//
//    func test_GetAllDessertUseCase_getUpcomingMovies_shouldReturnArrayOfMovies() {
//        runAsyncTest { [weak self] in
//            // Arrange
//            guard let strongSelf = self else { return }
//            let sut = strongSelf.makeSutForSuccess()
//            // Act
//            guard let movies = try await sut.getUpcomingMovies() else {
//                XCTFail()
//                return
//            }
////           Assert
//            XCTAssertEqual(movies.movies.count, 20)
//        }
//    }
//
//    private class SpyGetUpcomingMoviesUseCase: GetUpcomingMoviesUseCase {
//        
//        // MARK: - Properties
//        
//        var discoverRepository: DiscoverRepository
//        
//        // MARK: - Methods
//        
//        init(discoverRepository: DiscoverRepository) {
//            self.discoverRepository = discoverRepository
//        }
//    }
//    
}
