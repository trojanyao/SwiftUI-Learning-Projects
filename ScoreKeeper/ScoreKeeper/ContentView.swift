//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by 姚陶钧 on 2025/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var players: [Player] = [
        Player(name: "Alice", score: 0),
        Player(name: "Bob", score: 0),
        Player(name: "Charlie", score: 0)
    ]

    
    var body: some View {
        NavigationView {
            List {
                ForEach($players) { $player in
                    HStack {
                        TextField("Name", text: $player.name)
                        Text("\(player.score)")
                        Stepper("ABC\(player.score)", value: $player.score, in: 0...10)
//                        Stepper("\(player.score)", onIncrement: {
//                            if player.score < 20 { player.score += 1 }
//                        }, onDecrement: {
//                            if player.score > 0 { player.score -= 1 }
//                        })
                            .labelsHidden()
                    }
                }
                .onMove(perform: move)
            }
            .navigationTitle("Players")
            .toolbar {
                EditButton()
            }
        
            
            Button("Add Player", systemImage: "plus") {
                players.append(Player(name: "", score: 0))
            }
            
        }
    }
    
    func move(from source: IndexSet, to destination: Int) {
        players.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}
