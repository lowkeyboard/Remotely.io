//
//  HomeViewModel.swift
//  remotely
//
//  Created by cagla copuroglu on 4.08.2022.
//

import Foundation
import PokemonAPI

final class HomeViewModel: PokemonViewModelProtocol {

    weak var coordinator: FeedCoordinator?
    var delegate: PokemonViewModelDelegate?
    private var pokemons: [Pokemon] = []
    private let service: APIServiceProtocol

    init(service: APIServiceProtocol, coordinator: FeedCoordinator) {
        self.service = service
        self.coordinator = coordinator
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
            print(error ?? "Error occured with pokemon service.")
        }

    }

    func selectPokemon(at index: Int) {
        print("pokemon at \(index) has selected")
        self.coordinator?.navigateToDetail(index: index)

    }

    private func notify(_ output: PokemonViewModelOutput) {
        delegate?.handleViewModelOutput(output)
    }

}
