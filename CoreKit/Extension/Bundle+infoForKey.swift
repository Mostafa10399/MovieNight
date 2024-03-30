//
//  Bundle+infoForKey.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 29/03/2024.
//

import Foundation
extension Bundle {
    func info<T>(forKey key: String) -> T? {
        return Bundle.main.infoDictionary?[key] as? T
    }
}
