//
//  ViewController.swift
//  MTG_Cards
//
//  Created by Dmitriy Baskakov on 06.09.2022.
//

import UIKit
import Alamofire

class MTGViewController: UIViewController {
    
    enum Section { case main }
    
    //MARK: - Properties
    private var cards: [Card] = []
    private var filtredCards: [Card] = []
    private var selectedCard: Displayed?
    private let url = "https://api.magicthegathering.io/v1/cards"
    
    var dataSource: UITableViewDiffableDataSource<Section, Card>!
    var isSearching = false
    
    lazy var cardsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.register(MTGCell.self, forCellReuseIdentifier: MTGCell.identifire)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.keyboardDismissMode = .onDrag
        
        return tableView
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureSearchController()
        getCardsList()
        configureDataSource()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    //MARK: Methods
    //Configure view
    private func configureView() {
        title = "MTG Card Finder"
        view.backgroundColor = .systemBackground
        
        view.addSubview(cardsTableView)
        NSLayoutConstraint.activate([
            cardsTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            cardsTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardsTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardsTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    //Configure search controller
    private func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchBar.placeholder = "Enter card name"
        searchController.searchResultsUpdater = self
        
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
    }
    
    //Configure Data Source
    private func configureDataSource() {
        dataSource = UITableViewDiffableDataSource<Section, Card>(tableView: cardsTableView, cellProvider: { (tableView, indexPath, card) -> UITableViewCell? in
            let cell = tableView.dequeueReusableCell(withIdentifier: MTGCell.identifire, for: indexPath) as! MTGCell
            cell.set(cards: card)
            return cell
        })
    }
    
    //Update data
    private func updateData(on cards: [Card]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Card>()
        snapshot.appendSections([.main])
        snapshot.appendItems(cards)
        DispatchQueue.main.async { self.dataSource.apply(snapshot, animatingDifferences: true) }
    }
}

//MARK: - Extensions
//Table view delegate and data source
extension MTGViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cardsTableView.dequeueReusableCell(withIdentifier: MTGCell.identifire) as! MTGCell
        let card = cards[indexPath.row]
        cell.set(cards: card)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        cardsTableView.deselectRow(at: indexPath, animated: true)
        let detailViewController = MTGDetailViewController()
        detailViewController.card = selectedCard
        navigationController?.pushViewController(detailViewController, animated: true)
        
    }
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedCard = cards[indexPath.row]
        return indexPath
    }
}

//Network call
extension MTGViewController {
    func getCardsList() {
        AF.request(url)
            .validate()
            .responseDecodable(of: Cards.self) { responce in
                guard let data = responce.value else { return }
                let cards = data.cards
                self.cards = cards
                self.updateData(on: cards)
            }
    }
}

//Update search result
extension MTGViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let filter = searchController.searchBar.text, !filter.isEmpty else {
            updateData(on: cards)
            isSearching = false
            return
        }
        
        isSearching = true
        filtredCards = cards.filter { $0.nameLabel.lowercased().contains(filter.lowercased()) }
        updateData(on: filtredCards)
    }
}

