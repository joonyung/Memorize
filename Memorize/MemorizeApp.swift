//
//  MemorizeApp.swift
//  Memorize
//
//  Created by JY on 2023/01/26.
//

import SwiftUI

@main
struct MemorizeApp: App {
    @StateObject var game = EmojiMemoryGame()
    @StateObject var themeStore = ThemeStore(named: "Default")
    
    var body: some Scene {
        WindowGroup {
//            EmojiMemoryGameView(game: game)
//                .environmentObject(themeStore)
            ThemeChooser(game: game)
                .environmentObject(themeStore)
        }
    }
}
