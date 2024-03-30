//
//  RequestConfiguration .swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

public typealias Parameters = [String: Any]

public enum ParameterEncoding {
    case url
    case json
    
    func encode(_ request: URLRequest, with parameters: Parameters) throws -> URLRequest {
         var request = request
         
         switch self {
         case .url:
             guard let url = request.url else {
                 throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
             }
             
             if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) {
                 urlComponents.queryItems = parameters.map { URLQueryItem(name: $0.key, value: "\($0.value)") }
                 request.url = urlComponents.url
             }
             
             if request.value(forHTTPHeaderField: "Content-Type") == nil {
                 request.setValue("application/x-www-form-urlencoded; charset=utf-8", forHTTPHeaderField: "Content-Type")
             }
             
         case .json:
             request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: [])
             request.setValue("application/json", forHTTPHeaderField: "Content-Type")
         }
         
         return request
     }
}

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

public struct HTTPHeader {
    public let name: String
    public let value: String
    
    public init(name: String, value: String) {
        self.name = name
        self.value = value
    }
}
