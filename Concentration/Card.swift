//
//  Card.swift
//  Concentration
//
//  Created by Claudia Cortes on 6/2/22.
//

import Foundation


struct  Card{
    var isFacedUp=false
    var isMatched=false
    var identifier:Int
    
    static var identifierFactory=0
    static func getUnicIdentifier()->Int{
        identifierFactory+=1
        return identifierFactory
    }
    init(){
        self.identifier=Card.getUnicIdentifier()
    }
    
}
