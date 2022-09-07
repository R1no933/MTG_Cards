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
    let nameLabel = MTGTitleLabel(fontSize: 30)
    let setNameLabel = MTGTitleLabel(fontSize: 26)
    let typeLabel = MTGBodyLabel(fontSize: 24)
    let manaCostLabel = MTGBodyLabel(fontSize: 24)
    let powerLabel = MTGBodyLabel(fontSize: 24)
    let textLabel = MTGBodyLabel(fontSize: 22)
    let numberLabel = MTGBodyLabel(fontSize: 20)
    
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
        view.addSubview(typeLabel)
        view.addSubview(manaCostLabel)
        view.addSubview(powerLabel)
        view.addSubview(textLabel)
        view.addSubview(numberLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            nameLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            nameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            setNameLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 5),
            setNameLabel.centerXAnchor.constraint(equalTo: nameLabel.centerXAnchor),
            setNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            typeLabel.topAnchor.constraint(equalTo: setNameLabel.bottomAnchor, constant: 80),
            typeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            typeLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            typeLabel.heightAnchor.constraint(equalToConstant: 22),
            
            manaCostLabel.topAnchor.constraint(equalTo: typeLabel.bottomAnchor, constant: 10),
            manaCostLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            manaCostLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            manaCostLabel.heightAnchor.constraint(equalToConstant: 22),
            
            powerLabel.topAnchor.constraint(equalTo: manaCostLabel.bottomAnchor, constant: 10),
            powerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            powerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            powerLabel.heightAnchor.constraint(equalToConstant: 22),
            
            textLabel.topAnchor.constraint(equalTo: powerLabel.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            textLabel.heightAnchor.constraint(equalToConstant: 200),
            
            numberLabel.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 40),
            numberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            numberLabel.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
}
