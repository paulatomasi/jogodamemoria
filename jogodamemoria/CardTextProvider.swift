//
//  CardTextProvider.swift
//  jogodamemoria
//
//  Created by Paula Tomasi Andrade on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

protocol CardTextProvider {
    
    func text(for identifier: Int) -> String
    
}

class CuteAnimalsEmojiProvider: CardTextProvider {
    var emojisOptions = ["🐶", "🦁", "🐱", "🐵",]
    var emojis = [Int: String]()
    
    func text(for identifier: Int) -> String {
        if let emoji = self.emojis[identifier] {
            return emoji
        }
        
        let emoji = self.emojisOptions.removeRandom()
        self.emojis[identifier] = emoji
        
        return emoji
    }
}

class AwesomeFruitsEmojiProvider: CardTextProvider {
    var emojisOptions = ["🍌", "🍉", "🍓", "🍑",]
    var emojis = [Int: String]()
    
    func text(for identifier: Int) -> String {
        if let emoji = self.emojis[identifier] {
            return emoji
        }
        
        let emoji = self.emojisOptions.removeRandom()
        self.emojis[identifier] = emoji
        
        return emoji
    }
}
