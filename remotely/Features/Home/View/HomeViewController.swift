//
//  HomeViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 25.03.2022.
//

import UIKit
import PokemonAPI
import SnapKit

final class HomeViewController: UIViewController, Coordinating {

    var coordinator: Coordinator?
    let service = PokemonService()
    var pokemon: Pokemon

    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        title = "Home view controller"
        view.backgroundColor = .RTWhite
    }
    


}
