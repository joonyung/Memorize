//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by JY on 2023/02/03.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    private static let emoji = ["🚗", "🚙", "🚕", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽" , "🦼", "🩼", "🛴", "🚲", "🛵", "🏍️", "🛺", "🛞"]
    
//    struct Vehicles: Theme {
//        let name: String = "vehicles"
//        let emoji = ["🚗", "🚙", "🚕", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🚜", "🦯", "🦽" , "🦼", "🩼", "🛴", "🚲", "🛵", "🏍️", "🛺", "🛞"]
//        var numberOfCardPairsToShow: Int = 6
//        let color = "cyan"
//    }
//
//    struct Animals: Theme {
//        let name: String = "animals"
//        let emoji = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁"]
//        var numberOfCardPairsToShow: Int = 4
//        let color = "orange"
//    }
//
//    struct Fruits: Theme {
//        let name: String = "fruits"
//        let emoji = ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐"]
//        var numberOfCardPairsToShow: Int = 5
//        let color = "blue"
//    }
//
//    let themes: [Theme] = [Vehicles(), Animals(), Fruits()]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        let emojis = emoji.shuffled()
        
        return MemoryGame<String>(numberOfPairsOfCards: 10) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model = createMemoryGame()
    
    
    var cards: Array<Card> {
        model.cards
    }
    
//    var point: Int {
//        model.point
//    }
    
    // MARK: - Intent(s)
    func choose(_ card: Card) {
        model.choose(card)
    }
    
    func makeNewGame() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
    func shuffle() {
        model.shuffle()
    }
    
    func restart() {
        model = EmojiMemoryGame.createMemoryGame()
    }
    
}

