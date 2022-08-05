//
//  Pokemon.swift
//  Core
//
//  Created by cagla copuroglu on 2.08.2022.
//  Copyright © 2022 Benoit PASQUIER. All rights reserved.
//

import Foundation

public struct Pokemon : Codable, Identifiable, Equatable, Hashable {
    public let id =  UUID()
    public let name: String
    public let url: String
}
