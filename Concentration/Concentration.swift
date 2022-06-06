//
//  Concentration.swift
//  Concentration
//
//  Created by Claudia Cortes on 6/2/22.
//

import Foundation



struct Concentration{
    // var cards=Array<Card>()
    var cards=[Card]()
    var indexOfFaceduP:Int?{
        get{
            let faceUpCardIndices=cards.indices.filter{cards[$0].isFacedUp}.oneAndOnly
//            return faceUpCardIndices.count==1 ?  faceUpCardIndices.first:nil
            return faceUpCardIndices
//            var foundIndex:Int?
//            for index in cards.indices{
//                if cards[index].isFacedUp{
//                    if foundIndex==nil{
//                        foundIndex=index
//                    }else{
//                        return nil
//                    }
//                }
//            }
//            return foundIndex
        }
        
        set(newValue){
            for index in cards.indices{
                cards[index].isFacedUp=(index==newValue)
            }
        }
    }
    
    mutating func chooseCard(at index:Int){
        if !cards[index].isMatched{
            print("face matched")
            print("index \(index) indexOfFaceduP \(indexOfFaceduP)")
            if let matchIndex=indexOfFaceduP,matchIndex != index{
                print("entra")
                
                if cards[matchIndex]==cards[index]{
                    cards[matchIndex].isMatched=true
                    cards[index].isMatched=true
                }
                cards[index].isFacedUp=true
            }else{
                indexOfFaceduP=index
            }
            
        }
    }
        
        
        init (numberOfPairsOfCards:Int){
            for _ in 0...numberOfPairsOfCards{
                let card=Card()
                let matchingCard=card
                cards+=[card,card]
            }
            
            //TODO: shuffle the cards
        }
        
    }


extension Collection{
    var oneAndOnly:Element?{
        return count  == 1 ? first : nil
    }
}
