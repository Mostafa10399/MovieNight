//
//  MovieDetailsPresentable.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

 struct MovieDetailsPresentable {
    let thumbnail: URL?
    let title: String
    let overview: String
    let revenue: String
    let releseYear: String
    let status: String
    let type: String
    let rate: String
    let runTime: String
    
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
