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

    var tableView: UITableView!
    private var PokemonList: [PokemonPresentation] = []
    var homeTitle: UILabel!

    override func viewDidLoad() {
        view.backgroundColor = .white
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        tableView = UITableView(frame: .zero)
        homeTitle = UILabel(frame: .zero)
        self.view.addSubview(tableView)
        self.view.addSubview(homeTitle)
        makeTableView()

        homeTitle.text = "Pokemon Library"
        homeTitle.font = UIFont(name: "Pokemon Solid", size: 40)
        homeTitle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(50)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
        }

        viewModel.delegate = self
        viewModel.load()

    }

    func makeTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(PokemonTableCell.self, forCellReuseIdentifier: PokemonTableCell.identifier)
        tableView.rowHeight = 100
        tableView.separatorColor = .RTPrimary

        tableView.snp.makeConstraints { make in
            make.top.equalTo(homeTitle.snp.bottom).offset(5)
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()

        }

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
            self.tableView.reloadData()

        }
    }

}

extension HomeViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

         let cell: PokemonTableCell = tableView.dequeueReusableCell(withIdentifier: PokemonTableCell.identifier) as! PokemonTableCell
        let Pokemon = PokemonList[indexPath.row]
        cell.saveModel(pokemon: Pokemon, index: indexPath.row)

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
