//
//  CastMember.swift
//  CoreKit
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation

public struct CastMember: Codable {
    public let adult: Bool
    public let gender, id: Int
    public let name, originalName: String
    public let popularity: Double
    public let profilePath: String?
    public let castID: Int?
    public let character: String?
    public let creditID: String
    public let order: Int?
    public let department, job: String?
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order, department, job
    }
}
