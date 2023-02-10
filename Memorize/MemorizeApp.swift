//
//  MemorizeApp.swift
//  Memorize
//
//  Created by JY on 2023/01/26.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
