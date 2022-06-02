//
//  Concentration.swift
//  Concentration
//
//  Created by Claudia Cortes on 6/2/22.
//

import Foundation



class Concentration{
    // var cards=Array<Card>()
    var cards=[Card]()
    var indexOfFaceduP:Int?
    
    func chooseCard(at index:Int){
        if !cards[index].isMatched{
            print("face matched")
            print("index \(index) indexOfFaceduP \(indexOfFaceduP)")
            if let matchIndex=indexOfFaceduP,matchIndex != index{
                print("entra")
                
                if cards[matchIndex].identifier==cards[index].identifier{
                    cards[matchIndex].isMatched=true
                    cards[index].isMatched=true
                }
                cards[index].isFacedUp=true
                indexOfFaceduP=nil
            }else{
                print("face down")
                print("index \(index) indexOfFaceduP \(indexOfFaceduP)")
                for  flipDownIndex in cards.indices{
                    cards[flipDownIndex].isFacedUp=false
                }
                cards[index].isFacedUp=true
                indexOfFaceduP=index
            }
            
        }
    }
        
        
        init (numberOfPairsOfCards:Int){
            for _ in 0...numberOfPairsOfCards{
                let card=Card() 
                let matchingCard=card
                //            cards.append(card)
                //            cards.append(matchingCard)
                cards+=[card,card]
            }
            
            //TODO: shuffle the cards
        }
        
    }
