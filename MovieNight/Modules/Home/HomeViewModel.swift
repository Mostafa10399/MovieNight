//
//  HomeViewModel.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import Foundation

final class HomeViewModel: GoToMovieDetailsView {

    // MARK: - Properties
    
    @Published private(set) var view: HomeView
    
    // MARK: - Methods
    
    init() {
        self.view = .root
    }

    func navigateToMovieDetailsView(by movieId: String) {
        view = .movieDetails
    }
}

protocol GoToMovieDetailsView {
    func navigateToMovieDetailsView(by movieId: String)
}
