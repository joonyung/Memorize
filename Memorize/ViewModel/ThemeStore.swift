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
            insertTheme(named: "Vehicles", emojis: "๐๐๐๐๐๐๐๐ป๐๐๐๐๐๐๐โ๏ธ๐ซ๐ฌ๐ฉ๐๐ธ๐ฒ๐๐ถโต๏ธ๐ค๐ฅ๐ณโด๐ข๐๐๐๐๐๐๐๐บ๐", numberOfCardPairs: 12)
            insertTheme(named: "Sports", emojis: "๐โพ๏ธ๐โฝ๏ธ๐พ๐๐ฅ๐โณ๏ธ๐ฅ๐ฅ๐โท๐ณ", numberOfCardPairs: 7)
            insertTheme(named: "Music", emojis: "๐ผ๐ค๐น๐ช๐ฅ๐บ๐ช๐ช๐ป", numberOfCardPairs: 5)
            insertTheme(named: "Animals", emojis: "๐ฅ๐ฃ๐๐๐๐๐๐๐ฆ๐๐๐๐๐๐ฆ๐ฆ๐ฆ๐ฆ๐ข๐๐ฆ๐ฆ๐ฆ๐๐๐ฆ๐ฆ๐ฆง๐ฆฃ๐๐ฆ๐ฆ๐ช๐ซ๐ฆ๐ฆ๐ฆฌ๐๐ฆ๐๐ฆ๐๐ฉ๐ฆฎ๐๐ฆค๐ฆข๐ฆฉ๐๐ฆ๐ฆจ๐ฆก๐ฆซ๐ฆฆ๐ฆฅ๐ฟ๐ฆ", numberOfCardPairs: 14)
            insertTheme(named: "Animal Faces", emojis: "๐ต๐๐๐๐ถ๐ฑ๐ญ๐น๐ฐ๐ฆ๐ป๐ผ๐ปโโ๏ธ๐จ๐ฏ๐ฆ๐ฎ๐ท๐ธ๐ฒ", numberOfCardPairs: 10)
            insertTheme(named: "Flora", emojis: "๐ฒ๐ด๐ฟโ๏ธ๐๐๐๐พ๐๐ท๐น๐ฅ๐บ๐ธ๐ผ๐ป", numberOfCardPairs: 8)
            insertTheme(named: "Weather", emojis: "โ๏ธ๐คโ๏ธ๐ฅโ๏ธ๐ฆ๐งโ๐ฉ๐จโ๏ธ๐จโ๏ธ๐ง๐ฆ๐โ๏ธ๐ซ๐ช", numberOfCardPairs: 6)
            insertTheme(named: "COVID", emojis: "๐๐ฆ ๐ท๐คง๐ค", numberOfCardPairs: 4)
            insertTheme(named: "Faces", emojis: "๐๐๐๐๐๐๐๐คฃ๐ฅฒโบ๏ธ๐๐๐๐๐๐๐๐ฅฐ๐๐๐๐๐๐๐๐๐คช๐คจ๐ง๐ค๐๐ฅธ๐คฉ๐ฅณ๐๐๐๐๐๐โน๏ธ๐ฃ๐๐ซ๐ฉ๐ฅบ๐ข๐ญ๐ค๐ ๐ก๐คฏ๐ณ๐ฅถ๐ฅ๐๐ค๐ค๐คญ๐คซ๐คฅ๐ฌ๐๐ฏ๐ง๐ฅฑ๐ด๐คฎ๐ท๐คง๐ค๐ค ", numberOfCardPairs: 16)
            insertTheme(named: "Fruits", emojis: "๐๐๐๐๐๐๐๐๐๐ซ", numberOfCardPairs: 8)
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
