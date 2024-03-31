//
//  RemoteAPI.swift
//  CoreKitTests
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

extension RemoteAPI {
    func request<T: Codable>(_ service: RemoteService) async throws -> T {
       let fileName = service.baseUrl
       if let task = Bundle.unitTestForSpyMovieNightDiscoverApiSuccess.url(forResource: fileName, withExtension: "json") {
           do {
           let data = try Data(contentsOf: task)
           let decoder = JSONDecoder()
           let jsonData = try decoder.decode(T.self, from: data)
           return jsonData
       } catch {
           throw Errors.decodingError(error)
       }
       } else {
           throw Errors.serverError(statusCode: 500)
       }
   }
}
