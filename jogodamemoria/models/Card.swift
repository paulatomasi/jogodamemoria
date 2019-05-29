//
//  Card.swift
//  jogodamemoria
//
//  Created by Paula Tomasi Andrade on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

// usada para representar uma estrutura de dados
// cada copia é uma nova instancia
struct Card {
    var identifier: Int
    var isFaceUp: Bool = false
    var isMatched: Bool = false
    
    var cardState: CardState {
        if isFaceUp {
            return .faceUp
        } else if isMatched {
            return .matched
        } else {
            return .faceDown
        }
    }
    
    init(identifier: Int) {
        self.identifier = identifier
    }
}

enum CardState {
    case faceDown, faceUp, matched
}
