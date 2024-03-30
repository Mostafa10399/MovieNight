//
//  HTTPMethod.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 30/03/2024.
//

import Foundation

public typealias Parameters = [String: Any]

public enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
}

