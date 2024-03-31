//
//  SpyMainMovieNightRepository_Tests.swift
//  CoreKitTests
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import XCTest
@testable import CoreKit

final class SpyMainMovieNightRepository_Tests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    private func makeSut(spy: DiscoverApis) -> DiscoverRepository {
        SpyMainDiscoverRepository(spy: spy)
    }
    
    private func makeSuccessDiscoverApis() -> DiscoverApis {
        SpyMovieNightDiscoverApiSuccess()
    }
    
    private func makeFailDiscoverApis() -> DiscoverApis {
        SpyMovieNightDiscoverApiFail()
    }
    
    func test_spyMainMovieNightRepository_getNowPlaying_shouldCheckMoviesCount() throws {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut(spy: strongSelf.makeSuccessDiscoverApis())
            // Act
            guard let movies = try await sut.getNowPlaying()?.results else {
                XCTFail()
                return
            }
            // Assert
            XCTAssertEqual(movies.count, 20)
        }
    }
    
    func test_spyMainMovieNightRepository_getNowPlaying_shouldThrowError() throws {
        // Arrange
        let sut = makeSut(spy: makeFailDiscoverApis())
        let exp = XCTestExpectation(description: #function)
        var thrownError: Errors?
        let errorHandler = { thrownError = $0 }
        // Act
        Task {
            do {
                _ = try await sut.getNowPlaying()?.results
                XCTFail()
            } catch let errorMessage as Errors  {
                errorHandler(errorMessage)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2)
        // Assert
        XCTAssertNotNil(thrownError)
    }
    
    func test_spyMainMovieNightRepository_getUpcomingMovies_shouldCheckMoviesCount() throws {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut(spy: strongSelf.makeSuccessDiscoverApis())
            // Act
            guard let movies = try await sut.getUpComing()?.results else {
                XCTFail()
                return
            }
            // Assert
            XCTAssertEqual(movies.count, 20)
        }
    }
    
    func test_spyMainMovieNightRepository_getUpcomingMovies_shouldThrowError() throws {
        // Arrange
        let sut = makeSut(spy: makeFailDiscoverApis())
        let exp = XCTestExpectation(description: #function)
        var thrownError: Errors?
        let errorHandler = { thrownError = $0 }
        // Act
        Task {
            do {
                _ = try await sut.getUpComing()?.results
                XCTFail()
            } catch let errorMessage as Errors  {
                errorHandler(errorMessage)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2)
        // Assert
        XCTAssertNotNil(thrownError)
    }
    
    func test_spyMainMovieNightRepository_getPopularMovies_shouldCheckMoviesCount() throws {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut(spy: strongSelf.makeSuccessDiscoverApis())
            // Act
            guard let movies = try await sut.getUpComing()?.results else {
                XCTFail()
                return
            }
            // Assert
            XCTAssertEqual(movies.count, 20)
        }
    }
    
    func test_spyMainMovieNightRepository_getPopularMovies_shouldThrowError() throws {
        // Arrange
        let sut = makeSut(spy: makeFailDiscoverApis())
        let exp = XCTestExpectation(description: #function)
        var thrownError: Errors?
        let errorHandler = { thrownError = $0 }
        // Act
        Task {
            do {
                _ = try await sut.getPopular()?.results
                XCTFail()
            } catch let errorMessage as Errors  {
                errorHandler(errorMessage)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2)
        // Assert
        XCTAssertNotNil(thrownError)
    }
    
    func test_spyMainMovieNightRepository_getMovieDetails_shouldReturnMovieData() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut(spy: strongSelf.makeSuccessDiscoverApis())
            // Act
            let details = try await sut.getMovieDetails(id: 1011985)
            // Assert
            XCTAssertNotNil(details)
        }
    }
    
    func test_spyMainMovieNightRepository_getMovieDetails_shouldThrowError() {
        // Arrange
        let sut = makeSut(spy: makeFailDiscoverApis())
        let exp = XCTestExpectation(description: #function)
        var thrownError: Errors?
        let errorHandler = { thrownError = $0 }
        // Act
        Task {
            do {
                _ = try await sut.getMovieDetails(id: 1011985)
                XCTFail()
            } catch let errorMessage as Errors  {
                errorHandler(errorMessage)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2)
        // Assert
        XCTAssertNotNil(thrownError)
    }
    
    func test_spyMainMovieNightRepository_getMovieCredits_shouldReturnMovieCastMember() {
        runAsyncTest { [weak self] in
            // Arrange
            guard let strongSelf = self else { return }
            let sut = strongSelf.makeSut(spy: strongSelf.makeSuccessDiscoverApis())
            // Act
            let details = try await sut.getMovieCredits(id: 1011985)
            // Assert
            XCTAssertNotNil(details)
        }
    }
    
    func test_spyMainMovieNightRepository_getMovieCredits_shouldThrowError() {
        // Arrange
        let sut = makeSut(spy: makeFailDiscoverApis())
        let exp = XCTestExpectation(description: #function)
        var thrownError: Errors?
        let errorHandler = { thrownError = $0 }
        // Act
        Task {
            do {
                _ = try await sut.getMovieCredits(id: 1011985)
                XCTFail()
            } catch let errorMessage as Errors  {
                errorHandler(errorMessage)
            }
            exp.fulfill()
        }
        wait(for: [exp], timeout: 2)
        // Assert
        XCTAssertNotNil(thrownError)
    }
}
