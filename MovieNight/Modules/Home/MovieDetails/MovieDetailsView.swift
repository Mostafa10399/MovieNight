//
//  MovieDetailsView.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 27/03/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    
    // MARK: - Properties
    
    @ObservedObject var viewModel: MovieDetailsViewModel
    @State private var didAppear: Bool = true
    
    // MARK: - CodeView
    
    var body: some View {
        GeometryReader(content: { geo in
            ScrollView(showsIndicators: false, content: {
                LazyVStack(spacing: 16) {
                    AsyncImage(url: viewModel.poster, transaction: .init(animation: .bouncy(duration: 1)), content: { imageState in
                        switch imageState {
                        case .empty:
                             ZStack {
                                 Color.gray
                                     .opacity(0.4)
                                 ProgressView()
                             }
                        case .success(let image):
                                            image.resizable()
                        case .failure(_):
                            Image(systemName: "photo")
                                .resizable()
                        @unknown default:
                            Image(systemName: "photo")
                                .resizable()
                        }
                    })
                    .frame(maxWidth: .infinity)
                    .frame(height: geo.size.height * 0.5)
                    .overlay {
                        VStack{
                            Spacer()
                            VStack{
                                Text(viewModel.title)
                                    .font(.custom("Montserrat-Bold", size: 24))
                                HStack {
                                    Text(viewModel.year)
                                        .font(.custom("Montserrat-Regular", size: 15))
                                    Circle()
                                        .fill(Color(.accent))
                                        .frame(width: 5, height: 5)
                                    Text(viewModel.type)
                                        .font(.custom("Montserrat-Regular", size: 15))
                                    Circle()
                                        .fill(Color(.accent))
                                        .frame(width: 5, height: 5)
                                    Text(viewModel.runTime)
                                        .font(.custom("Montserrat-Regular", size: 15))
                                }
                                HStack {
                                    Image(systemName: "star.fill")
                                        .foregroundStyle(.yellow)
                                        .frame(width: 15, height: 15)
                                    Text(viewModel.rate)
                                        .font(.custom("Montserrat-Regular", size: 13))
                                }
                            }
                            .foregroundStyle(.accent)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background {
                                LinearGradient(colors: [Color.clear, Color.black], startPoint: .top, endPoint: .bottom)
                            }
                        }
                    }
                    VStack(spacing: 8){
                        Text("Plot Summary")
                            .font(.custom("Montserrat-SemiBold", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.accent)
                        Text(viewModel.overView)
                            .foregroundStyle(.accent)
                            .font(.custom("Montserrat-Regular", size: 14))
                    }
                    .padding(.horizontal, 16)
                    VStack(spacing: 8){
                        Text("Cast")
                            .font(.custom("Montserrat-SemiBold", size: 18))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .foregroundStyle(.accent)
                        Text(viewModel.overView)
                            .foregroundStyle(.accent)
                            .font(.custom("Montserrat-Regular", size: 14))
                    }
                    .padding(.horizontal, 16)
                }
            })
            .padding(.bottom)
        })
        .frame(maxHeight: .infinity)
        .onAppear {
            if didAppear {
                viewModel.getMovieDetails()
                self.didAppear = false
            }
        }
        .displayLoader(isLoading: viewModel.isDataLoading)
//        .displayError(errorMessage: viewModel.errorMessage, isFullScreen: false) {
//            viewModel.didTapOnTryAgain()
//        }
    }
}

