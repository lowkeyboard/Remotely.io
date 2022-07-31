//
//  HomeViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 25.03.2022.
//

import UIKit

class HomeViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    @IBOutlet private weak var movieTitleLabel: UILabel!
    @IBOutlet private weak var artistNameLabel: UILabel!
    @IBOutlet private weak var genreLabel: UILabel!

    var viewModel: MovieDetailViewModelProtocol!

    override func viewDidLoad() {
        title = "Home view controller"
        view.backgroundColor = .RTWhite
        viewModel.delegate = self

    }
}

extension HomeViewController: MovieDetailViewModelDelegate {

    func showDetail(_ presentation: MovieDetailPresentation) {
        movieTitleLabel.text = presentation.title
        artistNameLabel.text = presentation.artistName
        genreLabel.text = presentation.genre

        print("\(movieTitleLabel.text) \n \(artistNameLabel.text) \n \(genreLabel.text)")
    }
}
