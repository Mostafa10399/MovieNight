//
//  MovieSection.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 30/03/2024.
//

import SwiftUI
import CoreKit

struct MovieSection: View {
    
    // MARK: - Properties
    
    let section: MovieSectionPresentable
    
    // MARK: - CodeView
    
    var body: some View {
        VStack(spacing: 12) {
            Text(section.title)
                .font(.custom("Montserrat-SemiBold", size: 16))
                .frame(maxWidth: .infinity, alignment: .leading)
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack {
                    ForEach(section.movies, id: \.id) { movie in
                        AsyncImage(url: movie.thumbnail, transaction: .init(animation: .bouncy(duration: 0.2)), content: { state in
                            switch state {
                            case .empty:
                                 ZStack {
                                     Color.gray.opacity(0.4)
                                     ProgressView()
                                 }
                            case let .success(image):
                                image
                                    .resizable()
                            case .failure(_):
                                Image(systemName: "photo")
                                    .resizable()
                            @unknown default:
                                EmptyView()
                            }
                        })
                        .frame(width: 160, height: 160)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                            .overlay {
                                VStack {
                                    Spacer()
                                    VStack(alignment: .leading){
                                        Text(movie.title)
                                            .foregroundStyle(.accent)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.custom("Montserrat-Medium", size: 13))
                                            .lineLimit(1)
                                        
                                        Text(movie.year)
                                            .foregroundStyle(.accent)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                            .font(.custom("Montserrat-Medium", size: 12))
                                            .lineLimit(1)
                                    }
                                    .frame(maxWidth: .infinity)
                                    .padding(6)
                                    .background {
                                        Rectangle()
                                            .fill(Color(.black).opacity(0.6))
                                        
                                    }
                                }
                            }
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                }
                .padding(.horizontal, 16)
            }
            .padding(.horizontal, -16)
        }
        .padding(.horizontal, 16)
    }
}
