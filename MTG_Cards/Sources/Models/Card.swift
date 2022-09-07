//
//  Cards.swift
//  MTG_Cards
//
//  Created by Dmitriy Baskakov on 06.09.2022.
//

import Foundation

struct Card: Decodable {
    private let name: String?
    private let setName: String?
    private let type: String?
    private let manaCost: String?
    private let power: String?
    private let text: String?
    private let number: String?
}

extension Card: Displayed {
    
    var nameLabel: String {
        guard let name = name else {
            return "Card hasn't name"
        }
        return String("\(name)")
    }
    
    var setNameLabel: String {
        guard let setName = setName else {
            return "Card hasn't set"
        }
        return String("Card set: \(setName)")
    }
    
    var typeLabel: String {
        guard let type = type else {
            return "Card hasn't type"
        }
        return String("Card type: \(type)")
    }
    
    var manaCostLabel: String {
        guard let manaCost = manaCost else {
            return "Card hasn't cost"
        }
        return String("Card cost: \(manaCost)")
    }
    
    var powerLabel: String {
        guard let power = power else {
            return "Card hasn't power"
        }
        return String("Card power: \(power)")
    }
    
    var textLabel: String {
        guard let text = text else {
            return "Card hasn't description"
        }
        return String("Card description:\n\(text)")
    }
    
    var numberLabel: String {
        guard let number = number else {
            return "Card hasn't number"
        }
        return String("Card number: \(number)")
    }
}
