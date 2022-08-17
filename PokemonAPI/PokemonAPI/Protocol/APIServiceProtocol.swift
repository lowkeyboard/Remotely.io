//
//  APIServiceProtocol.swift
//  Core
//
//  Created by cagla copuroglu on 2.08.2022.
//

import Foundation

 public protocol APIServiceProtocol {

    func allPokemon( success: @escaping (_ pokemon: [Pokemon]) -> Void, failure: @escaping (_ error: Error?) -> Void )

    func getSprite(url: String, success: @escaping (PokemonSprites) -> Void)

    func getFlavorTextEntry(index: Int, success: @escaping (_ flavorTextEntry: String?) -> Void, failure: @escaping (_ error: Error?) -> Void )

}
