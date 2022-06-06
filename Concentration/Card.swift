//
//  Card.swift
//  Concentration
//
//  Created by Claudia Cortes on 6/2/22.
//

import Foundation


struct  Card:Hashable{
    var hashValue: Int{return identifier}
    
    var isFacedUp=false
    var isMatched=false
    private var identifier:Int
    
    static var identifierFactory=0
    static func getUnicIdentifier()->Int{
        identifierFactory+=1
        return identifierFactory
    }
    static func ==(lhs:Card,rhs:Card)->Bool{
        return lhs.identifier==rhs.identifier
    }
    init(){
        self.identifier=Card.getUnicIdentifier()
    }
 
}
