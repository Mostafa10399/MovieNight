//
//  MovieDetails.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation

public struct MovieDetails: Codable {
    public let adult: Bool
    public let backdropPath: String
    public let budget: Int
    public let genres: [MovieType]
    public let homepage: String
    public let id: Int
    public let imdbID, originalLanguage, originalTitle, overview: String?
    public let popularity: Double
    public let posterPath: String?
    public let productionCountries: [ProductionCountry]
    public let releaseDate: String?
    public let revenue, runtime: Int?
    public let status, tagline, title: String?
    public let video: Bool
    public let voteAverage: Double
    public let voteCount: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case productionCountries = "production_countries"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}


