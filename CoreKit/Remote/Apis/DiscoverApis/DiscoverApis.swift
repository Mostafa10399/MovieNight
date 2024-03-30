//
//  DiscoverApis.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public protocol DiscoverApis: RemoteAPI {
    func getNowPlaying(token: String) async throws -> Movies
    func getUpComing(token: String) async throws -> Movies
    func getPopular(token: String) async throws -> Movies
}
