//
//  ViewController.swift
//  jogodamemoria
//
//  Created by Paula Tomasi Andrade on 25/05/19.
//  Copyright © 2019 CWI Software. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    lazy var game = Game(numberOfPairOfCards: buttonsArray.count / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    var cardTextProvider: CardTextProvider!
    private let congratsSegue = "show-congratulations"
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var buttonsArray: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardIndex = buttonsArray.firstIndex(of: sender), self.game.cards[cardIndex].cardState != .matched {
            self.game.chooseCard(at: cardIndex)
            self.updateViewFromModel()
            self.flipCount += 1
            
            if self.game.matchedCardsCount == self.game.cards.count {
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0, execute: {
                    self.performSegue(withIdentifier: self.congratsSegue, sender: nil)
                })
            }
        }
    }
    
    func updateViewFromModel() {
        for index_ in self.game.cards.indices {
            let button = self.buttonsArray[index_]
            let card = self.game.cards[index_]
            
            switch(card.cardState) {
                case .matched:
                    button.backgroundColor = .clear
                    button.setTitle("", for: .normal)
                case .faceUp:
                    button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                    button.setTitle(self.cardTextProvider.text(for: card.identifier), for: .normal)
                default:
                    button.backgroundColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
                    button.setTitle("", for: .normal)
            }
        }
    }
}
