//
//  HomeContracts.swift
//  remotely
//
//  Created by cagla copuroglu on 4.08.2022.
//

import Foundation

protocol PokemonViewModelProtocol: AnyObject {
    var delegate: PokemonViewModelDelegate? { get set }
    func load()
    func selectPokemon(at index: Int)
}

enum PokemonViewModelOutput: Equatable {
    case updateTitle(String)
    case setLoading(Bool)
    case showPokemonList([PokemonPresentation])
}

protocol PokemonViewModelDelegate: AnyObject {

    func handleViewModelOutput(_ output: PokemonViewModelOutput)
}
