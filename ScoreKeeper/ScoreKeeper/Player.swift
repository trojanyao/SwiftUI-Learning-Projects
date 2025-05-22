//
//  Player.swift
//  ScoreKeeper
//
//  Created by 姚陶钧 on 2025/5/22.
//

import Foundation

struct Player: Identifiable {
    let id = UUID()
    
    var name: String
    var score: Int
}
