//
//  Error.swift
//  remotely
//
//  Created by cagla copuroglu on 23.06.2022.
//

import Foundation

struct CatServiceError: Codable {
    let message: String
    let errors: [String: [String]]
}
