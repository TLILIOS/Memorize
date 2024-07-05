//
//  MemorizeGame.swift
//  Memorize
//
//  Created by HTLILI on 02/07/2024.
//

import Foundation
struct MemoryGame<CardContent> {
 private(set) var cards: Array<Card>
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add a numberOfPairsOfCards X 2 Cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    
    func choose(_ card: Card) {
        
    }
   mutating func shuffle() {
        cards.shuffle()
    }
    struct Card {
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
    }
}
