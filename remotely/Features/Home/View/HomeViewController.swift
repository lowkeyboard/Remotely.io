//
//  HomeViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 25.03.2022.
//

import UIKit
import SnapKit

final class HomeViewController: UIViewController {

    var viewModel: PokemonViewModelProtocol! {
        didSet {
            viewModel.delegate = self
        }
    }

    private weak var tableView: UITableView!
    private var PokemonList: [PokemonPresentation] = []

    override func viewDidLoad() {
        title = "Home view controller"
        view.backgroundColor = .RTWhite
        viewModel.delegate = self

        viewModel.load()

    }
}

extension HomeViewController: PokemonViewModelDelegate {

    func handleViewModelOutput(_ output: PokemonViewModelOutput) {
        switch output {
        case .updateTitle(let title):
            self.title = title
        case .setLoading(let isLoading):
            UIApplication.shared.isNetworkActivityIndicatorVisible = isLoading
        case .showPokemonList(let PokemonList):
            self.PokemonList = PokemonList
            tableView.reloadData()
        }
    }

}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonListCell", for: indexPath)
        let Pokemon = PokemonList[indexPath.row]
        cell.textLabel?.text = Pokemon.title
        cell.detailTextLabel?.text = Pokemon.detail
        return cell
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return PokemonList.count
    }
}

extension HomeViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        viewModel.selectPokemon(at: indexPath.row)

    }
}
