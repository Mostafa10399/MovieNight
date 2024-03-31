//
//  MovieDetailsPresentable.swift
//  CoreKit
//
//  Created by Amr Salman on 26/04/2022.
//

import Foundation

public struct MovieDetailsPresentable {
    public let thumbnail: URL?
    public let title: String
    public let overview: String
    public let revenue: String
    public let releseYear: String
    public let status: String
    public let type: String
    public let rate: String
    public let runTime: String
    
    init(_ movieTuple: MovieDetails) {
        if let poster = movieTuple.posterPath {
            self.thumbnail = URL(string: "https://image.tmdb.org/t/p/w500" + poster)
        } else {
            thumbnail = nil
        }
        self.title = movieTuple.title ?? ""
        self.overview = movieTuple.overview ?? ""
        self.revenue = movieTuple.revenue == nil ? "" : ["$", "\(movieTuple.revenue ?? 0)"].compactMap { $0 }.joined()
        self.status = movieTuple.status ?? ""
        let formatter: DateFormatter = {
            $0.dateFormat = "yyyy-MM-dd"
            return $0
        }(DateFormatter())
        let calendar = Calendar.current
        if let date = movieTuple.releaseDate, let releaseDate = formatter.date(from: date),
            let year = calendar.dateComponents([.year], from: releaseDate).year {
            self.releseYear = "\(year)"
        } else {
            self.releseYear = "Unkown"
        }
        let firstTwoGenres = movieTuple.genres.prefix(2).map { $0.name }
        self.type = firstTwoGenres.joined(separator: ", ")
        self.rate = String(format: "%.2f", movieTuple.voteAverage)
        let hours = (movieTuple.runtime ?? 0) / 60
        let minutes = (movieTuple.runtime ?? 0) % 60

        self.runTime = "\(hours)h \(minutes)m"
    }
}
