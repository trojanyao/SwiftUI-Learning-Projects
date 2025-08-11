//
//  Alphabetizer.swift
//  Alphabetizer
//
//  Created by TROJAN on 2025/7/4.
//

import Foundation

@Observable
class Alphabetizer {
    private let tileCount = 3
    private var vocab: Vocabulary
    
    var tiles = [Tile]() // () 表示调用数组构造器初始化，可以理解为 var tiles: [Tile] = []
    var score = 0
    var message: Message = .instructions
    
    init(vocab: Vocabulary = .landAnimals) {
        self.vocab = vocab
        startNewGame()
    }
    
    /// Checks if tiles are in alphabetical order
    func submit() {
        // Check if the tiles are alphabetized
        let userSortedTiles = tiles.sorted {
            $0.position.x < $1.position.x
        }
        let alphabeticallySortedTiles = tiles.sorted {
            $0.word.lexicographicallyPrecedes($1.word)
        }
        let isAlphabetized = userSortedTiles == alphabeticallySortedTiles
        
        // If alphabetized, increment the score
        if isAlphabetized {
            score += 1
        }
        
        // Update the message to win or lose
        message = isAlphabetized ? .youWin : .tryAgain
        
        // Flip over correct tiles
        for (tile, correctTile) in zip(userSortedTiles, alphabeticallySortedTiles) {
            let tileIsAlphabetized = tile == correctTile
            tile.flipped = tileIsAlphabetized
        }
        
        Task { @MainActor in
            // Delay 2 seconds
            try await Task.sleep(for: .seconds(2))
            
            // If alphabetized, generate new tiles
            if isAlphabetized {
                startNewGame()
            }
            
            // Flip tiles back to words
            for tile in tiles {
                tile.flipped = false
            }
            
            // Display instructions
            message = .instructions
        }
    }
    
    // MARK: private implementation
    
    /// Updates `tiles` with a new set of unalphabetized words
    private func startNewGame() {
        let newWords = vocab.selectRandomWords(count: tileCount)
        
        if tiles.isEmpty {
            for word in newWords {
                tiles.append(Tile(word: word))
            }
        } else {
            // Assign new words to existing tiles
            for (tile, word) in zip(tiles, newWords) {
                tile.word = word
            }
        }
    }
}
