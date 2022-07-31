//
//  HomeProtocol.swift
//  remotely
//
//  Created by cagla copuroglu on 30.07.2022.
//

import Foundation
protocol MovieDetailViewModelDelegate: class {
    func showDetail(_ presentation: MovieDetailPresentation)
}

protocol MovieDetailViewModelProtocol {
    var delegate: MovieDetailViewModelDelegate? { get set }
    func load()
}
