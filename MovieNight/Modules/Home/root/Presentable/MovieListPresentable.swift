//
//  MovieListPresentable.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

public struct MovieListPresentable {
    let thumbnail: URL?
    let title: String
    let overview: String
    let year: String
    let id: Int
    
    init(_ movieTuple: MoviesResult) {
        self.id = movieTuple.id
        if let poster = movieTuple.posterPath {
            self.thumbnail = URL(string:"https://image.tmdb.org/t/p/w500" + poster)
        } else {
            thumbnail = nil
        }
        self.title = movieTuple.title
        self.overview = movieTuple.overview
        self.year = movieTuple.releaseDate ?? ""
    }
}
