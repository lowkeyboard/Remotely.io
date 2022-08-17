//
//  DetailResponse.swift
//  Core
//
//  Created by cagla copuroglu on 2.08.2022.
//

import Foundation

// MARK: - PokemonDescription
struct PokemonDescription: Codable {
    let flavor_text_entries: [FlavorTextEntries]
}

// MARK: - FlavorTextEntries
struct FlavorTextEntries: Codable {
    let flavor_text: String
    let language: Language
}

// MARK: - Language
struct Language : Codable {
    var name: String?
    var url: String?
}

// MARK: - Version
struct Version : Codable {
    var name: String?
    var url: String?
}
