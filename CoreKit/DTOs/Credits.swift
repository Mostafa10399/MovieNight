//
//  Credits.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation

public struct Credits: Codable {
    let id: Int
    let crew: [CrewMember]
    let cast: [CastMember]
}
