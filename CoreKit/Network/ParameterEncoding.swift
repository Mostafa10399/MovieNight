//
//  ParameterEncoding.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 30/03/2024.
//

import Foundation

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
