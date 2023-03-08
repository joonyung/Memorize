//
//  ThemeChooser.swift
//  Memorize
//
//  Created by JY on 2023/03/07.
//

import SwiftUI

struct ThemeChooser: View {
    @EnvironmentObject var store: ThemeStore
    var game: EmojiMemoryGame
    
    @State var chosenThemeId: Int? = nil
    
    var body: some View {
        NavigationView {
            List {
                ForEach(store.themes) { theme in
                    
                    NavigationLink(destination: EmojiMemoryGameView(game: game).onAppear {
                        restartGameIfNecessary(theme: theme)
                    }) {
                        VStack(alignment: .leading) {
                            Text(theme.name)
                                .font(.title)
                            Text(theme.emojis)
                        }
                    }
                }
            }
        }
        .navigationTitle("Manage Themes")
    }
    
    func restartGameIfNecessary(theme: Theme) {
        if chosenThemeId == nil || chosenThemeId! != theme.id {
            chosenThemeId = theme.id
            game.attachTheme(with: theme)
            game.restart()
        }
    }
}

struct ThemeChooser_Previews: PreviewProvider {
    static var previews: some View {
        ThemeChooser(game: EmojiMemoryGame())
            .environmentObject(ThemeStore(named: "Preview"))
    }
}
