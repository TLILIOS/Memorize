//
//  MemorizeGame.swift
//  Memorize
//
//  Created by HTLILI on 02/07/2024.
//

import Foundation
struct MemoryGame<CardContent> where CardContent: Equatable {
 private(set) var cards: Array<Card>
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        //add a numberOfPairsOfCards X 2 Cards
        for pairIndex in 0..<max(2, numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id: "\(pairIndex+1)a"))
            cards.append(Card(content: content, id: "\(pairIndex+1)b"))
        }
    }
    
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
    }
    
    func index(of card: Card) -> Int {
        for index in cards.indices {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0 // FIXME: Bogus!
    }
   mutating func shuffle() {
        cards.shuffle()
       print(cards)
    }
    struct Card: Equatable, Identifiable, CustomDebugStringConvertible {
        
        static func == (lhs: Card, rhs: Card) -> Bool {
            return lhs.isFaceUp == rhs.isFaceUp && lhs.isMatched == rhs.isMatched && lhs.content == rhs.content
        }
        
        var isFaceUp = true
        var isMatched = false
        let content: CardContent
        var id: String
        var debugDescription: String {
            "\(id): \(content) \(isFaceUp ? "UP" : "DOWN") \(isMatched ? "MATCHED" : "NOT MATCH")"
        }
        
    
    }
}
