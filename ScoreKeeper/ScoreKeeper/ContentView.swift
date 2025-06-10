//
//  ContentView.swift
//  ScoreKeeper
//
//  Created by 姚陶钧 on 2025/5/22.
//

import SwiftUI

struct ContentView: View {
    @State private var scoreboard = Scoreboard()
    @State private var staringPoints = 0
    
    var body: some View {
        VStack {
            SettingsView(doesHighestScoreWin: $scoreboard.doesHighestScoreWin, startingPoints: $staringPoints)
                .disabled(scoreboard.state != .setup)
            
            List {
                ForEach($scoreboard.players) { $player in
                    HStack {
                        HStack {
                            if scoreboard.winners.contains(player) {
                                Image(systemName: "crown.fill")
                                    .foregroundStyle(.yellow)
                            }
                            
                            TextField("Name", text: $player.name)
                                .disabled(scoreboard.state != .setup)
                        }
                        Text("\(player.score)")
                        Stepper("ABC\(player.score)", value: $player.score, in: 0...10)
                            .labelsHidden()
                    }
                }
                .onMove(perform: move)
            }
            .navigationTitle("Score Keeper")
            .toolbar {
                EditButton()
            }
        }
        
        Button("Add Player", systemImage: "plus") {
            scoreboard.players.append(Player(name: "", score: 0))
        }
        .opacity(scoreboard.state == .setup ? 1.0 : 0)
        
        HStack {
            switch scoreboard.state {
            case .setup:
                Button("Start Game", systemImage: "play.fill") {
                    scoreboard.state = .playing
                    scoreboard.resetScores(to: staringPoints)
                }
            case .playing:
                Button("End Game", systemImage: "stop.fill") {
                    scoreboard.state = .gameOver
                }
            case .gameOver:
                Button("Reset Game", systemImage: "arrow.counterclockwise") {
                    scoreboard.state = .setup
                }
            }
        }
        .buttonStyle(.bordered)
        .buttonBorderShape(.capsule)
        .controlSize(.large)
        .tint(.blue)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        scoreboard.players.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}
