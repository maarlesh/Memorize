//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by EI-LAP-8464 on 25/10/25.
//
import Foundation
import SwiftUI

class EmojiMemorizeGame{
    
    private static let emojis = ["🎃", "👻", "🕸️", "🧛", "🧟", "🕷️"];
    
    private var model = createMemoryGame()
    
    private static func createMemoryGame() -> MemorizeGame<String>{
        return MemorizeGame(noOfPairCards: 4, cardContentFactory: { (pairIndex : Int) -> String in
                if emojis.indices.contains(pairIndex){
                    EmojiMemorizeGame.emojis[pairIndex]
                }else{
                    EmojiMemorizeGame.emojis[0]
                }
            }
        )
    }

    var cards : Array<MemorizeGame<String>.Card>{
        return model.cards
    }
    
    func choose(_ card: MemorizeGame<String>.Card){
        model.chooseCard(card)
    }
    
    var getCurrentTheme : MemorizeTheme {
        return model.currentTheme
    }
    
    func setCurrentTheme(theme : MemorizeTheme) {
        model.currentTheme = theme
    }
}
