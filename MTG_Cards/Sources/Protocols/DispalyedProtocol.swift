//
//  DispalyedProtocol.swift
//  MTG_Cards
//
//  Created by Dmitriy Baskakov on 06.09.2022.
//

import Foundation

protocol Displayed {
    var nameLabel: String { get }
    var setNameLabel: String { get }
    var typeLabel: String { get }
    var manaCostLabel: String { get }
    var powerLabel: String { get }
    var textLabel: String { get }
    var numberLabel: String { get }
}
