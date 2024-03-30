//
//  MovieNightService.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public protocol MovieNightService: RemoteService {
     var mainRoute: String { get }
}

extension MovieNightService {
    public var baseUrl: String {
        return "https://api.themoviedb.org/3"
    }
}
