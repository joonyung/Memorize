//
//  ThemeChooser.swift
//  Memorize
//
//  Created by JY on 2023/03/06.
//

import Foundation

class ThemeStore: ObservableObject {
    var name: String
    @Published var themes = [Theme]()
    
    
    init(named name: String) {
        self.name = name
        //restoreFromUserDefaults()
        if themes.isEmpty {
            insertTheme(named: "Vehicles", emojis: "🚙🚗🚘🚕🚖🏎🚚🛻🚛🚐🚓🚔🚑🚒🚀✈️🛫🛬🛩🚁🛸🚲🏍🛶⛵️🚤🛥🛳⛴🚢🚂🚝🚅🚆🚊🚉🚇🛺🚜", numberOfCardPairs: 12)
            insertTheme(named: "Sports", emojis: "🏈⚾️🏀⚽️🎾🏐🥏🏓⛳️🥅🥌🏂⛷🎳", numberOfCardPairs: 7)
            insertTheme(named: "Music", emojis: "🎼🎤🎹🪘🥁🎺🪗🪕🎻", numberOfCardPairs: 5)
            insertTheme(named: "Animals", emojis: "🐥🐣🐂🐄🐎🐖🐏🐑🦙🐐🐓🐁🐀🐒🦆🦅🦉🦇🐢🐍🦎🦖🦕🐅🐆🦓🦍🦧🦣🐘🦛🦏🐪🐫🦒🦘🦬🐃🦙🐐🦌🐕🐩🦮🐈🦤🦢🦩🕊🦝🦨🦡🦫🦦🦥🐿🦔", numberOfCardPairs: 14)
            insertTheme(named: "Animal Faces", emojis: "🐵🙈🙊🙉🐶🐱🐭🐹🐰🦊🐻🐼🐻‍❄️🐨🐯🦁🐮🐷🐸🐲", numberOfCardPairs: 10)
            insertTheme(named: "Flora", emojis: "🌲🌴🌿☘️🍀🍁🍄🌾💐🌷🌹🥀🌺🌸🌼🌻", numberOfCardPairs: 8)
            insertTheme(named: "Weather", emojis: "☀️🌤⛅️🌥☁️🌦🌧⛈🌩🌨❄️💨☔️💧💦🌊☂️🌫🌪", numberOfCardPairs: 6)
            insertTheme(named: "COVID", emojis: "💉🦠😷🤧🤒", numberOfCardPairs: 4)
            insertTheme(named: "Faces", emojis: "😀😃😄😁😆😅😂🤣🥲☺️😊😇🙂🙃😉😌😍🥰😘😗😙😚😋😛😝😜🤪🤨🧐🤓😎🥸🤩🥳😏😞😔😟😕🙁☹️😣😖😫😩🥺😢😭😤😠😡🤯😳🥶😥😓🤗🤔🤭🤫🤥😬🙄😯😧🥱😴🤮😷🤧🤒🤠", numberOfCardPairs: 16)
            insertTheme(named: "Fruits", emojis: "🍏🍎🍐🍊🍋🍌🍉🍇🍓🫐", numberOfCardPairs: 8)
        }
    }
    
    
    
    
    // MARK: - Intent
    func theme(at index: Int) -> Theme {
        let safeIndex = min(max(index, 0), themes.count - 1)
        return themes[safeIndex]
    }
    
    @discardableResult
    func removeTheme(at index: Int) -> Int {
        if themes.count > 1, themes.indices.contains(index) {
            themes.remove(at: index)
        }
        return index % themes.count
    }
    
    func insertTheme(named name : String, emojis: String? = nil, numberOfCardPairs: Int = 0, at index: Int = 0) {
        let unique = (themes.max(by: { $0.id < $1.id })?.id ?? 0) + 1
        let theme = Theme(name: name, emojis: emojis ?? "", numberOfCardPairs: numberOfCardPairs, id: unique)
        let safeIndex = min(max(index, 0), themes.count)
        themes.insert(theme, at: safeIndex)
    }
}


struct Theme: Identifiable {
    var name: String
    var emojis: String
    var numberOfCardPairs: Int
    var id: Int
    
    fileprivate init(name: String, emojis: String, numberOfCardPairs: Int, id: Int) {
        self.name = name
        self.emojis = emojis
        self.numberOfCardPairs = numberOfCardPairs
        self.id = id
    }
}
