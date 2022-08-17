//
//  PokemonPresentation.swift
//  remotely
//
//  Created by cagla copuroglu on 4.08.2022.
//

import Foundation
import PokemonAPI

final class PokemonPresentation: NSObject {

    let title: String
    let detail: String

    init(title: String, detail: String) {
        self.title = title
        self.detail = detail
        super.init()
    }

    override func isEqual(_ object: Any?) -> Bool {
        guard let other = object as? PokemonPresentation else { return false }
        return self.title == other.title && self.detail == other.detail
    }
}

extension PokemonPresentation {

    convenience init(pokemon: Pokemon) {
        self.init(title: pokemon.name,
                  detail: pokemon.url)
    }
}
