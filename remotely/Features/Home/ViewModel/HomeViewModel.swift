//
//  HomeViewModel.swift
//  remotely
//
//  Created by cagla copuroglu on 4.08.2022.
//

import Foundation
import PokemonAPI

final class HomeViewModel: PokemonViewModelProtocol {

    var delegate: PokemonViewModelDelegate?
    private var pokemons: [Pokemon] = []
    private let service: APIServiceProtocol

    init(service: APIServiceProtocol) {
        self.service = service
    }

    func load() {

        notify(.updateTitle("Pokemons"))
        notify(.setLoading(true))

        service.allPokemon {[weak self] results in
            guard let self = self else { return }
            self.notify(.setLoading(false))
            self.pokemons = results
            let presenatations = self.pokemons.map({ PokemonPresentation(pokemon: $0) })
                self.notify(.showPokemonList(presenatations))
        } failure: { error in
            print(error)
        }

    }

    func selectPokemon(at index: Int) {
        print("pokemon at \(index) has selected")
    }

    private func notify(_ output: PokemonViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }

}
