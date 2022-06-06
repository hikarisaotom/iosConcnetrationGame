//
//  ViewController.swift
//  Concentration
//
//  Created by Claudia Cortes on 6/1/22.
//

import UIKit
import SwiftUI

class ConcentrationViewController: UIViewController {
    private lazy var game:Concentration=Concentration(numberOfPairsOfCards: (cardButtons.count+1)/2)
    
    var flippedCount=0{
        didSet{
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet weak var flipCountLabel: UILabel!{
        didSet{
            updateFlipCountLabel()
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    private func updateFlipCountLabel(){
        let attribuites:[NSAttributedString.Key:Any]=[
            .strokeWidth:5.0,
            .strokeColor:UIColor.orange
        ]
        let attributedString=NSAttributedString(string:"Flips: \(flippedCount)",attributes: attribuites)
        //            flipCountLabel.text="Flips: \(flippedCount)"
        flipCountLabel.attributedText=attributedString
    }
    
    //    @IBOutlet var cardButons2:Array<UIButton>!
    //    var emojisOptions=["👻","🎃","🦇","🕷","🧙🏻‍♀️","🕸"]
    var emojisOptions="👻🎃🦇🕷🧙🏻‍♀️🕸"
    
    var theme:String?{
        didSet{
            emojisOptions = theme ?? ""
            emoji=[:]
            updateViewFromModel()
        }
    }
    @IBAction func touchCard(_ sender: UIButton) {
        flippedCount=flippedCount+1
        
        
        if let cardNumber=cardButtons.firstIndex(of: sender){
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        //
    }
    
    func updateViewFromModel(){
        if cardButtons != nil{
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
        
    }
    
    
    //    var emoji=Dictionary<Int,String>()
    var emoji=[Card:String]()
    func emoji(for card:Card)->String{
        
        if emoji[card]==nil, emojisOptions.count>0{
            let randomStringIndex=emojisOptions.index(emojisOptions.startIndex, offsetBy:emojisOptions.count.arc4random )
            emoji[card]=String(emojisOptions.remove(at: randomStringIndex))
            
            
        }
        return emoji[card] ?? "?"
    }
    
}

extension Int{
    var arc4random:Int{
        if self>0{
            return Int(arc4random_uniform(UInt32(self)))
        }else if self<0{
            return -Int(arc4random_uniform(UInt32(abs(self))))
        }else{
            return 0
        }
        
    }
}
