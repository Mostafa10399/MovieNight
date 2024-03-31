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
        let request: URLRequest
        do {
            request = try service.asURLRequest()
        } catch {
            throw ErrorMessage(error: error)
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else {
                throw ErrorMessage(title: "Error", message: "Bad Request")
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw ErrorMessage(title: "Error", message: "Bad Request")
            }
            
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
            } catch {
                throw ErrorMessage(error: error)
            }
        } catch {
            throw ErrorMessage(error: error)
        }
    }
}

