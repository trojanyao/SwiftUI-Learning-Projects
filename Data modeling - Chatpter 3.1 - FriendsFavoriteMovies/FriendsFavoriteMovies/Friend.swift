//
//  Friend.swift
//  FriendsFavoriteMovies
//
//  Created by TROJAN on 2025/6/10.
//

import Foundation
import SwiftData

@Model
class Friend {
    var name: String
    var favoriteMovie: Movie?  // creates a (many-to-one) relationship between the Friend model and the Movie model
    
    init(name: String) {
        self.name = name
    }
    
    static let sampleData = [
        Friend(name: "Elena"),
        Friend(name: "Graham"),
        Friend(name: "Mayuri"),
        Friend(name: "Rich"),
        Friend(name: "Rody"),
    ]
}
