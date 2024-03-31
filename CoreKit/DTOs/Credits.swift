//
//  Credits.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation

public struct Credits: Codable {
    public let id: Int
    public let crew: [CrewMember]
    public let cast: [CastMember]
}
