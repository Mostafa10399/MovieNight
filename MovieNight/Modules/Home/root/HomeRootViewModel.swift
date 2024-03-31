//
//  HomeRootViewModel.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import Foundation
import CoreKit
import Combine

final class HomeRootViewModel: ObservableObject, BaseViewModel, GetPopularMoviesUseCase, GetUpcomingMoviesUseCase, GetNowPlayingMoviesUseCase {

    // MARK: - Properties
        
    @Published var isDataLoading: Bool
    @Published var errorMessage: ErrorMessage?
    private let goToMovieDetails: GoToMovieDetailsView
    let discoverRepository: DiscoverRepository
    var upComingMoviesSection: MovieSectionPresentable?
    var nowPlayingMoviesSection: MovieSectionPresentable?
    var popularMoviesSection: MovieSectionPresentable?
        
    // MARK: - Methods
    
    init(
        discoverRepository: DiscoverRepository,
        goToMovieDetails: GoToMovieDetailsView) {
            self.goToMovieDetails = goToMovieDetails
            self.discoverRepository = discoverRepository
            self.isDataLoading = false
        }
    
    func getData() {
        Task { [weak self] in
            guard let strongSelf = self else { return }
            defer { strongSelf.setIsDataLoading(false) }
            do {
                strongSelf.setIsDataLoading(true)
                strongSelf.setPopularMovies(try await strongSelf.getPopularMovies())
                strongSelf.setUpComingMovies(try await strongSelf.getUpcomingMovies())
                strongSelf.setNowPlayingMovies(try await strongSelf.getNowPlayingMovies())
            }
            catch let errorMessage as ErrorMessage {
                strongSelf.setErrorMessage(errorMessage)
            }
        }
    }
    
    private func setUpComingMovies(_ section: MovieSectionPresentable?) {
        self.upComingMoviesSection = section
    }
    
    private func setNowPlayingMovies(_ section: MovieSectionPresentable?) {
        self.nowPlayingMoviesSection = section
    }
    
    private func setPopularMovies(_ section: MovieSectionPresentable?) {
        self.popularMoviesSection = section
    }
    
    func didTapOnMovie(id: Int) {
        self.goToMovieDetails.navigateToMovieDetailsView(by: id)
    }
    
    func didTapOnTryAgain() {
        self.setErrorMessage(nil)
        self.getData()
    }
    
}
