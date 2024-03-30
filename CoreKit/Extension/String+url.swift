//
//  String+url.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation

extension String {
    func asURL() throws -> URL {
        guard let url = URL(string: self) else {
            throw NSError(domain: "Invalid URL", code: 0, userInfo: nil)
        }
        return url
    }
}
