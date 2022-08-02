//
//  HomeViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 25.03.2022.
//

import UIKit
import PokemonAPI

class HomeViewController: UIViewController, Coordinating {

    var coordinator: Coordinator?

    override func viewDidLoad() {
        title = "Home view controller"
        view.backgroundColor = .RTWhite
        

}
}
