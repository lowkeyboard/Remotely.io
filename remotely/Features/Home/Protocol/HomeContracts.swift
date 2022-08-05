//
//  HomeContracts.swift
//  remotely
//
//  Created by cagla copuroglu on 4.08.2022.
//

import Foundation

protocol PokemonViewModelProtocol: class {
    var delegate: PokemonViewModelDelegate? { get set }
    func load()
    func selectPokemon(at index: Int)
}

enum PokemonViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showPokemonList([PokemonPresentation])
}

protocol PokemonViewModelDelegate: class {

    func handleViewModelOutput(_ output: PokemonViewModelOutput)
//    func navigate(to route: PokemonViewRoute)
}

protocol DummyProtocol: class {
    var dummyDelegate: DummyDelegate? { get set }

    func dummyLoad()
}

protocol DummyDelegate: class {
    func welcome()

}
