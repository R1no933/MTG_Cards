//
//  MTGDetailViewController.swift
//  MTG_Cards
//
//  Created by Dmitriy Baskakov on 07.09.2022.
//

import UIKit

class MTGDetailViewController: UIViewController {
    
    //MARK: - Properties
    var card: Displayed?
    private let nameLabel = MTGTitleLabel(fontSize: 30)
    private let setNameLabel = MTGTitleLabel(fontSize: 26)
    private let typeLabel = MTGBodyLabel(fontSize: 24)
    private let manaCostLabel = MTGBodyLabel(fontSize: 24)
    private let powerLabel = MTGBodyLabel(fontSize: 24)
    private let textLabel = MTGBodyLabel(fontSize: 22)
    private let numberLabel = MTGBodyLabel(fontSize: 20)
    
    var viewsArray: [UIView] = []
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        set(with: card)
        configureView()
    }
    
    //MARK: - Methods
    //Set card info
    func set(with card: Displayed?) {
        nameLabel.text = card?.nameLabel
        setNameLabel.text = card?.setNameLabel
        typeLabel.text = card?.typeLabel
        manaCostLabel.text = card?.manaCostLabel
        powerLabel.text = card?.powerLabel
        textLabel.text = card?.textLabel
        numberLabel.text = card?.numberLabel
    }
    
    //Layouts
    private func configureView() {
        view.backgroundColor = .systemBackground
        title = String("Info about: \((card?.nameLabel) ?? "No Name")")
        
        view.addSubview(nameLabel)
        view.addSubview(setNameLabel)
        view.addSubview(numberLabel)
        
        viewsArray = [typeLabel, manaCostLabel, powerLabel, textLabel]
        
        for views in viewsArray {
            view.addSubview(views)
            
            NSLayoutConstraint.activate([
                views.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: Metrics.cardInfoLeadingAndTrailing),
                views.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -Metrics.cardInfoLeadingAndTrailing)
            ])
        }
        
    
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Metrics.nameTop),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: Metrics.nameHeight),
            
            setNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Metrics.setNameTop),
            setNameLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            setNameLabel.heightAnchor.constraint(equalToConstant: Metrics.setNameHeight),
            
            typeLabel.topAnchor.constraint(equalTo: setNameLabel.bottomAnchor, constant: Metrics.typeTop),
            typeLabel.heightAnchor.constraint(equalToConstant: Metrics.cardInfoHeight),
            
            manaCostLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: Metrics.manaCostTop),
            manaCostLabel.heightAnchor.constraint(equalToConstant: Metrics.cardInfoHeight),
            
            powerLabel.topAnchor.constraint(equalTo: manaCostLabel.bottomAnchor, constant: Metrics.powerTop),
            powerLabel.heightAnchor.constraint(equalToConstant: Metrics.cardInfoHeight),
            
            textLabel.topAnchor.constraint(equalTo: powerLabel.bottomAnchor, constant: Metrics.textTop),
            textLabel.heightAnchor.constraint(equalToConstant: Metrics.textHeight),
            
            numberLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: Metrics.numberTop),
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberLabel.heightAnchor.constraint(equalToConstant: Metrics.numberHeight)
        ])
    }
}

//MARK: - Extension
//Matrics
extension MTGDetailViewController {
    enum Metrics {
        static let nameTop: CGFloat = 30
        static let nameHeight: CGFloat = 32
        
        static let setNameTop: CGFloat = 5
        static let setNameHeight: CGFloat = 28
        
        static let typeTop: CGFloat = 50
        
        static let manaCostTop: CGFloat = 10
        
        static let powerTop: CGFloat = 10
        
        static let textTop: CGFloat = 60
        static let textHeight: CGFloat = 200
        
        static let numberTop: CGFloat = 100
        static let numberHeight: CGFloat = 40
        
        static let cardInfoLeadingAndTrailing: CGFloat = 20
        static let cardInfoHeight: CGFloat = 24
    }
}
