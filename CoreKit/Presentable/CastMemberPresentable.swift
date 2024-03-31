//
//  CastMemberPresentable.swift
//  CoreKit
//
//  Created by Amr Salman on 26/04/2022.
//

import Foundation

public struct CastMemberPresentable {
    public let profileUrl: URL?
    public let name: String
    public let characterName: String
    public let id: Int
    
    init(_ item: CastMember) {
        self.id = item.id
        if let profile = item.profilePath {
            self.profileUrl = URL(string: "https://image.tmdb.org/t/p/w500" + profile)
        } else {
            profileUrl = nil
        }
        self.name = item.name ?? ""
        self.characterName = item.character ?? ""
    }
}
