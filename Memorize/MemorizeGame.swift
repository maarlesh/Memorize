//
//  MemorizeGame.swift
//  Memorize
//
//  Created by EI-LAP-8464 on 25/10/25.
//

import Foundation

struct MemorizeGame<CardContent>{
    private(set) var cards : Array<Card>;
    
    var score : Int;
    
    var currentTheme : MemorizeTheme;
    
    init(noOfPairCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        currentTheme = .halloween
        score = 0
        
        for pairIndex in 0..<noOfPairCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func chooseCard(_ card : Card){
        
    }
    
    struct Card{
        var isFaceUp : Bool = false;
        var isMatched : Bool = false;
        var content : CardContent
    }
}


enum MemorizeTheme : String, CaseIterable {
    case halloween = "👻 Halloween"
    case emojis = "😊 Emojis"
    case love = "❤️ Love"
}

extension MemorizeTheme {
    var emojis: [String] {
        switch self {
        case .halloween:
            return ["🎃", "👻", "🕸️", "🧛", "🧟", "🕷️"]
        case .emojis:
            return ["😂", "😳", "😴", "😉", "💁🏻", "🥰", "😇", "🤩", "😡"]
        case .love:
            return ["❤️", "💕", "💘", "💖", "😍", "😘", "💌"]
        }
    }
}
