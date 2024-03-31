//
//  HomeRootView.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import SwiftUI

struct HomeRootView: View {
    
    // MARK: - Properties
    
    @State private var didAppear: Bool = true
    @ObservedObject var viewModel: HomeRootViewModel
    
    // MARK: - CodeView
    
    var body: some View {
        GeometryReader { geo in
            ScrollView(showsIndicators: false) {
                LazyVStack(spacing: 20) {
                    viewModel.nowPlayingMoviesSection.map { section in
                        MovieSection(section: section, didTapOnMovie: { viewModel.didTapOnMovie(id: $0) })
                    }
                    viewModel.upComingMoviesSection.map { section in
                        MovieSection(section: section, didTapOnMovie: { viewModel.didTapOnMovie(id: $0) })
                    }
                    viewModel.popularMoviesSection.map { section in
                        MovieSection(section: section, didTapOnMovie: { viewModel.didTapOnMovie(id: $0) })
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationTitle("Find a Movie To Watch")
        .onAppear {
            if didAppear {
                viewModel.getData()
                self.didAppear = false
            }
        }
        .displayLoader(isLoading: viewModel.isDataLoading)
        .displayError(errorMessage: viewModel.errorMessage, isFullScreen: false) {
            viewModel.didTapOnTryAgain()
        }
    }
    
}

