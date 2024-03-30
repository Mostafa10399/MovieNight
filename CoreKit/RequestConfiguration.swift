//
//  RequestConfiguration .swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public struct RequestConfiguration {
    // MARK: - Properties
    
    public let path: String
    public let method: HTTPMethod
    public let headers: [HTTPHeader]?
    public let parameters: Parameters?
    public let encoding: ParameterEncoding

    // MARK: - Methods
    
    public init(method: HTTPMethod = .get,
                path: String,
                headers: [HTTPHeader]? = nil,
                parameters: Parameters? = nil,
                encoding: ParameterEncoding = .url) {
        self.path = path
        self.method = method
        self.headers = headers
        self.parameters = parameters
        self.encoding = encoding
    }
}

