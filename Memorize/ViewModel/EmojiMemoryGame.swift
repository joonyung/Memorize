//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JY on 2023/02/03.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    @Published private var model = createMemoryGame()
    
    var theme: Theme? = nil
    var initiated: Bool = false
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis: [String] = Array("☀️🌤⛅️🌥☁️🌦🌧⛈🌩🌨❄️💨☔️💧💦🌊☂️🌫🌪").map({ String($0) })
//        if let themeEmojis = theme?.emojis {
//            emojis = Array(EmojiMemoryGame.theme.emojis).map({ String($0) }).shuffled()
//        }
//
        return MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    
    func attachTheme(with newTheme: Theme) {
        theme = newTheme
        
    }
    
    func createMemoryGameWithTheme() -> MemoryGame<String> {
        return MemoryGame<String>(numberOfPairsOfCards: theme!.numberOfCardPairs) { pairIndex in
            let emojis = Array(theme!.emojis).map({ String($0) }).shuffled()
            return emojis[pairIndex]
        }
    }
    
    
    // MARK: - Intent(s)
    var cards: Array<Card> { model.cards }
    
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = createMemoryGameWithTheme()
        initiated = false
    }
    
}

