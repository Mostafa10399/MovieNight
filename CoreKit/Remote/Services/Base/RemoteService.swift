//
//  RemoteService.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public protocol RemoteService {
    var baseUrl: String { get }
    var requestConfiguration: RequestConfiguration { get }
}

extension RemoteService {
    public func asURLRequest() throws -> URLRequest {
        let url = try baseUrl.asURL()
            .appendingPathComponent(requestConfiguration.path)
        var request = URLRequest(url: url)
        request.httpMethod = requestConfiguration.method.rawValue
        if let headers = requestConfiguration.headers {
            for header in headers {
                request.setValue(header.value, forHTTPHeaderField: header.name)
            }
        }
        if let parameters = requestConfiguration.parameters {
            request = try requestConfiguration.encoding.encode(request, with: parameters)
        }
        return request
    }
}
