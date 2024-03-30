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
                    
                }
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.horizontal, 12)
        .navigationTitle("Find a Movie To Watch")
        .onAppear {
            if didAppear {
                self.didAppear = false
            }
        }
//        .displayLoader(isLoading: viewModel.isDataLoading)
//        .displayError(errorMessage: viewModel.errorMessage, isFullScreen: false) {
//            viewModel.didTapOnTryAgain()
//        }
    }
    
    // MARK: - Methods
    
    func makeMovieList(_ listName: String, movies: [String]) -> some View {
        VStack(spacing: 12) {
            Text(listName)
                .font(.custom("Montserrat-SemiBold", size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
            List(movies, id: \.self) { item in
             Text("Hello")
            }
        }
    }
}

#Preview {
    HomeRootView(viewModel: HomeRootViewModel())
}
