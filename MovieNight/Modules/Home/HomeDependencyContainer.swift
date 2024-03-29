//
//  HomeDependencyContainer.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import Foundation

final class HomeDependencyContainer {
    
    // MARK: - Properties
    
    let sharedMainViewModel: MainViewModel
    let sharedHomeViewModel: HomeViewModel
    
    // MARK: - Methods
    
    init(parentDependencyContainer: MainDependencyContainer) {
        func makeHomeViewModel() -> HomeViewModel {
            HomeViewModel()
        }
        self.sharedMainViewModel = parentDependencyContainer.sharedMainViewModel
        self.sharedHomeViewModel = makeHomeViewModel()
    }
    
    func makeHomeNavigationController() -> HomeNavigationController {
        let homeRootViewModel = makeHomeRootViewModel()
        let homeRootView = makeHomeRootView(viewModel: homeRootViewModel)
        let movieDetailsViewFactory = { (id: Int) in
            let viewModel = self.makeMovieDetailsViewModel(id: id)
            return self.makeMovieDetailsView(viewModel: viewModel)
        }
        return HomeNavigationController(
            viewModel: sharedHomeViewModel,
            homeRootView: homeRootView,
            movieDetailsViewFactory: movieDetailsViewFactory)
    }
    private func makeHomeRootViewModel() -> HomeRootViewModel {
        HomeRootViewModel()
    }
    
    private func makeHomeRootView(viewModel: HomeRootViewModel) -> HomeRootView {
        HomeRootView(viewModel: viewModel)
    }
    
    private func makeMovieDetailsViewModel(id: Int) -> MovieDetailsViewModel {
        MovieDetailsViewModel()
    }
    
    private func makeMovieDetailsView(viewModel: MovieDetailsViewModel) -> MovieDetailsView {
        MovieDetailsView(viewModel: viewModel)
    }
    

}
