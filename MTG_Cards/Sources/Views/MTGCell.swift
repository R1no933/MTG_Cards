//
//  MTGCell.swift
//  MTG_Cards
//
//  Created by Dmitriy Baskakov on 06.09.2022.
//

import UIKit

class MTGCell: UITableViewCell {
    
    //MARK: - Properties
    static let identifire = "MTGCell"
    
    lazy var cardName: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .label
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.8
        label.lineBreakMode = .byTruncatingTail
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    lazy var cardType: UILabel = {
        let label = UILabel()
        
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.textColor = .secondaryLabel
        label.adjustsFontForContentSizeCategory = true
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.65
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    //MARK: - Inits
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Methods
    //Set cells
    func set(cards: Card) {
        cardName.text = cards.nameLabel
        cardType.text = cards.typeLabel
    }
    
    private func configure() {
        addSubview(cardName)
        addSubview(cardType)
        
        accessoryType = .disclosureIndicator
        
        NSLayoutConstraint.activate([
            cardName.topAnchor.constraint(equalTo: self.topAnchor, constant: Metrics.padding),
            cardName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.padding),
            cardName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -Metrics.padding),
            cardName.heightAnchor.constraint(equalToConstant: Metrics.nameHeight),
            
            cardType.topAnchor.constraint(equalTo: cardName.bottomAnchor, constant: Metrics.padding),
            cardType.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: Metrics.padding),
            cardType.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            cardType.heightAnchor.constraint(equalToConstant: Metrics.setNameHeight)
        ])
    }
}

//MARK: - Extensions
extension MTGCell {
    enum Metrics {
        static let padding: CGFloat = 10
        static let nameHeight: CGFloat = 22
        static let setNameHeight: CGFloat = 18
    }
}
