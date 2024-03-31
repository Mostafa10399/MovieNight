//
//  RemoteAPI.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public protocol RemoteAPI {
    func request<T: Codable>(_ service: RemoteService) async throws -> T
}

extension RemoteAPI {
    
    
    public func request<T: Codable>(_ service: RemoteService) async throws -> T {
        let request = try service.asURLRequest()
        let (data, _) = try await URLSession.shared.data(for: request)
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            return decodedData
        } catch {
            throw ErrorMessage(error: error)
        }
    }
}

