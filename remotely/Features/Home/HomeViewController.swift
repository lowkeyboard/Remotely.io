//
//  HomeViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 25.03.2022.
//

import UIKit

class HomeViewController: UIViewController, Coordinating {

    var coordinator: Coordinator?

     var viewModel: MovieDetailViewModel?

    override func viewDidLoad() {
        title = "Home view controller"
        view.backgroundColor = .RTWhite
    }

}
