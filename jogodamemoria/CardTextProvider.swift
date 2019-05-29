//
//  CardTextProvider.swift
//  jogodamemoria
//
//  Created by Paula Tomasi Andrade on 29/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import Foundation

protocol CardTextProvider: AnyObject {
    var emojis: [Int: String] { get set }
    var emojisOptions: [String] { get set }
    
    func text(for identifier: Int) -> String
}

extension CardTextProvider {
    func text(for identifier: Int) -> String {
        if let emoji = self.emojis[identifier] {
            return emoji
        }
        
        let emoji = emojisOptions.removeRandom()
        self.emojis[identifier] = emoji
        
        return emoji
    }
}

class CuteAnimalsEmojiProvider: CardTextProvider {
    var emojis = [Int: String]()
    var emojisOptions = ["🐶", "🦁", "🐱", "🐵",]
}

class AwesomeFruitsEmojiProvider: CardTextProvider {
    var emojis = [Int: String]()
    var emojisOptions = ["🍌", "🍉", "🍓", "🍑",]
}
