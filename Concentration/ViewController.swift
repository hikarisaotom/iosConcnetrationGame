//
//  ViewController.swift
//  Concentration
//
//  Created by Claudia Cortes on 6/1/22.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
    lazy var game:Concentration=Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    var flippedCount=0{
        didSet{
            flipCountLabel.text="Flips: \(flippedCount)"
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    

    //    @IBOutlet var cardButons2:Array<UIButton>!
    var emojisOptions=["👻","🎃","🦇","🕷","🧙🏻‍♀️","🕸"]
    @IBAction func touchCard(_ sender: UIButton) {
        flippedCount=flippedCount+1
        

        if let cardNumber=cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        //
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button=cardButtons[index]
            let card=game.cards[index]
            
            if card.isFacedUp{
                button.setTitle(emoji(for:card), for: UIControl.State.normal)
                button.backgroundColor=UIColor.white
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor=card.isMatched ? UIColor.black: UIColor.orange
            }
        }
    }
    
    
    //    var emoji=Dictionary<Int,String>()
    var emoji=[Int:String]()
    func emoji(for card:Card)->String{
        
        if emoji[card.identifier]==nil, emojisOptions.count>0{
            let randomindex=Int(arc4random_uniform(UInt32(emojisOptions.count)))
            emoji[card.identifier]=emojisOptions.remove(at: randomindex)
            
            
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

