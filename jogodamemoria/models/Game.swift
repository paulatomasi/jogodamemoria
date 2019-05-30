//
//  Game.swift
//  jogodamemoria
//
//  Created by Paula Tomasi Andrade on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

class Game {
    var cards = [Card]()
    var indexOfFirstSelectedCardOfThePair: Int?
    var matchedCardsCount: Int = 0
    
    init(numberOfPairOfCards: Int) {
        for index_ in 0 ..< numberOfPairOfCards {
            let card = Card(identifier: index_)
            self.cards += [card, card]
        }
        
        self.cards.shuffle()
    }
    
    func chooseCard(at index: Int) {
        // se a carta existe no cards e se ela ainda não foi combinada
        if self.cards.indices.contains(index), self.cards[index].isMatched == false {
           
            // se existe um indexOfFirstSelectedCardOfThePair e o index não é igual ao matchedIndex
            if let matchedIndex = self.indexOfFirstSelectedCardOfThePair, index != matchedIndex {
               
                // se as duas cartas tem o mesmo identifier
                if self.cards[matchedIndex].identifier ==  self.cards[index].identifier {
                    self.cards[matchedIndex].isMatched = true
                    self.cards[index].isMatched = true
                    self.matchedCardsCount += 2
                }
                
                self.cards[index].isFaceUp = true
                self.indexOfFirstSelectedCardOfThePair = nil
            } else { 
                for flipDownIndex in self.cards.indices {
                    self.cards[flipDownIndex].isFaceUp = false
                }
                
                self.cards[index].isFaceUp = true
                self.indexOfFirstSelectedCardOfThePair = index
            }
        }
    }
}
