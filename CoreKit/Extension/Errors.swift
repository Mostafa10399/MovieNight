//
//  Errors.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation

public enum Errors: Error {
    case invalidURL
    case networkError(Error)
    case serverError(statusCode: Int)
    case decodingError(Error)
}
