//
//  MoviesResult.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public struct MoviesResult: Codable {
    public let adult: Bool
    public let backdropPath: String
    public let genreIDS: [Int]
    public let id: Int
    public let originalLanguage, originalTitle, overview: String
    public let popularity: Double
    public let posterPath: String?
    public let releaseDate: String?
    public let title: String
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int

       enum CodingKeys: String, CodingKey {
           case adult
           case backdropPath = "backdrop_path"
           case genreIDS = "genre_ids"
           case id
           case originalLanguage = "original_language"
           case originalTitle = "original_title"
           case overview, popularity
           case posterPath = "poster_path"
           case releaseDate = "release_date"
           case title, video
           case voteAverage = "vote_average"
           case voteCount = "vote_count"
       }
}
