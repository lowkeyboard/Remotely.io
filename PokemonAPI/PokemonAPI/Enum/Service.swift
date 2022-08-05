//
//  Service.swift
//  Created by cagla copuroglu on 2.08.2022.
//

import Foundation

enum Service {
    static let baseUrl = "https://pokeapi.co/api/v2/"
    static let baseUrlImageSprite = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/"
    static let allPokemonList = Service.baseUrl + "pokemon"
    static let detailedSpecies = Service.baseUrl + "pokemon-species/"

        // static let searchPokemon = Service.baseUrl +
        // static let selectedPokemonBreed = Service.baseUrl + "{index+1}"

        // details -- index will be obtained from allPokemonList
        // pokeapi.co/api/v2/pokemon/{index+1}
        //https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/{INDEX+1}.png
        // front_default:"https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/3.png"

}
