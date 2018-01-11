//
//  PlayingCard.swift
//  PlayingCard
//
//  Created by Viral Chauhan on 08/01/18.
//  Copyright © 2018 Viral Chauhan. All rights reserved.
//

import Foundation

struct PlayingCard : CustomStringConvertible {
    
    var description: String {
        return "\(suit) \(rank)"
    }
    
    
    var suit: Suit
    var rank: Rank
    
    enum Suit: String, CustomStringConvertible {
        
        var description: String { return self.rawValue }
        
        case spades = "♠️"
        case hearts = "♥️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all = [Suit.spades, .hearts, .clubs, .diamonds]
    }
    
    enum Rank: CustomStringConvertible {
        
        var description: String {
            switch self {
            case .ace:
                return "A"
            case .numeric(let pips):
                return String(pips)
            case .face(let kind):
                return kind
            }
        }
        
        case ace
        case face (String)
        case numeric (Int)
        
        var order: Int {
            switch self {
            case .ace:
                return 1
            case .numeric(let pips):
                return pips
            case .face(let kind) where kind == "J":
                return 11
            case .face(let kind) where kind == "Q":
                return 12
            case .face(let kind) where kind == "K":
                return 13
            default:
                return 0
            }
        }
        
        static var all: [Rank] {
            
            var allRnak = [Rank.ace]
            for pips in 2...10 {
                allRnak.append(Rank.numeric(pips))
            }
            allRnak += [Rank.face("J"), .face("Q"), .face("K")]
            
            return allRnak
        }
    }
}
