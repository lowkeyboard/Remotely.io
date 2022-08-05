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

    override func viewDidLoad() {
        title = "Home view controller"
        view.backgroundColor = .RTWhite
        
        tableView = UITableView(frame: .zero)
        self.view.addSubview(tableView)

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TestCell.self, forCellReuseIdentifier: TestCell.identifier)
        tableView.estimatedRowHeight = 100
        DispatchQueue.main.async {
            self.tableView.backgroundView?.backgroundColor = .RTGreenDeep
        }
        
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        
        viewModel.delegate = self
        viewModel.load()

    }
}

class TestCell: UITableViewCell {
    static let identifier: String = "test_cell_identifier"

    var label: UILabel!

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.configure()
    }

    func configure() {
        label = UILabel(frame: .zero)
        self.contentView.addSubview(label)
        label.snp.makeConstraints { (make) in 
            make.left.equalToSuperview().offset(10)
            make.right.equalToSuperview().offset(-10)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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

         let cell: TestCell = tableView.dequeueReusableCell(withIdentifier: TestCell.identifier) as! TestCell
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
