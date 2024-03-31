//
//  MovieDetailsViewModel.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import Foundation
import CoreKit

final class MovieDetailsViewModel: ObservableObject, BaseViewModel, GetMovieDetailsUseCase, GetCastForMovieUseCase {
    
    
    // MARK: - Properties
    
    @Published var isDataLoading: Bool
    @Published var errorMessage: ErrorMessage?
    private let movieId: Int
    var discoverRepository: DiscoverRepository
    var poster: URL?
    var title: String
    var type: String
    var year: String
    var runTime: String
    var rate: String
    var overView: String
    var cast: [CastMemberPresentable]
    
    // MARK: - Methods
    
    init(discoverRepository: DiscoverRepository, movieId: Int) {
        self.discoverRepository = discoverRepository
        self.movieId = movieId
        self.isDataLoading = false
        self.title = ""
        self.type = ""
        self.year = ""
        self.runTime = ""
        self.rate = ""
        self.overView = ""
        self.cast = []
    }
    
    func getMovieDetails() {
        Task { [weak self] in
            guard let strongSelf = self else { return }
            defer { strongSelf.setIsDataLoading(false) }
            do {
                strongSelf.setIsDataLoading(true)
                guard let movieDetails = try await strongSelf.getMovieDetails(by: strongSelf.movieId) else { return }
                guard let cast = try await strongSelf.getMovieCast(by: strongSelf.movieId) else { return }
                
                strongSelf.setScreenData(movieDetails: movieDetails)
                strongSelf.setCast(cast)
            } catch let errorMessage as ErrorMessage {
                strongSelf.setErrorMessage(errorMessage)
            }
        }
    }
    
    private func setCast(_ actors: [CastMemberPresentable]) {
        self.cast = actors
    }
    
    private func setScreenData(movieDetails: MovieDetailsPresentable) {
        self.setMovieTitle(movieDetails.title)
        self.setMoviePoster(movieDetails.thumbnail)
        self.setMovieType(movieDetails.type)
        self.setMovieOverView(movieDetails.overview)
        self.setMovieReleasedYear(movieDetails.releseYear)
        self.setMovieRate(movieDetails.rate)
        self.setMovieRunTime(movieDetails.runTime)
    }
    
    private func setMovieTitle(_ title: String) {
        self.title = title
    }
    
    private func setMoviePoster(_ url: URL?) {
        self.poster = url
    }
    
    private func setMovieType(_ type: String) {
        self.type = type
    }
    
    private func setMovieReleasedYear(_ year: String) {
        self.year = year
    }
    
    private func setMovieOverView(_ overView: String) {
        self.overView = overView
    }
    
    private func setMovieRate(_ rate: String) {
        self.rate = rate
    }
    
    private func setMovieRunTime(_ duration: String) {
        self.runTime = duration
    }
}
