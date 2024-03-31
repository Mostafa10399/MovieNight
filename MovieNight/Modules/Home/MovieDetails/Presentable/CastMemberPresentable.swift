//
//  CastMemberPresentable.swift
//  MovieNight
//
//  Created by Mostafa Mahmoud on 31/03/2024.
//

import Foundation
import CoreKit

public struct CastMemberPresentable {
     let profileUrl: URL?
     let name: String
     let characterName: String
     let id: Int
    
    init(_ item: CastMember) {
        self.id = item.id
        if let profile = item.profilePath {
            self.profileUrl = URL(string: "https://image.tmdb.org/t/p/w500" + profile)
        } else {
            profileUrl = nil
        }
        self.name = item.name 
        self.characterName = item.character ?? ""
    }
}
