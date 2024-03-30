//
//  MovieListPresentable.swift
//  CoreKit
//
//  Created by Amr Salman on 25/04/2022.
//

import Foundation

public struct MovieListPresentable {
    public let thumbnail: URL?
    public let title: String
    public let overview: String
    public let year: String
    public let id: Int
    
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
