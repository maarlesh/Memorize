//
//  EmojiMemorizeGame.swift
//  Memorize
//
//  Created by EI-LAP-8464 on 25/10/25.
//
import Foundation
import SwiftUI

class EmojiMemorizeGame{
    let game = MemorizeGame<String>(noOfPairCards: 3) { pairIndex in
        ["🎃", "👻", "🕷️"][pairIndex]
    }

    var cards : Array<MemorizeGame<String>.Card>{
        return game.cards
    }
    
    func choose(_ card: MemorizeGame<String>.Card){
        game.chooseCard(card)
    }
}
