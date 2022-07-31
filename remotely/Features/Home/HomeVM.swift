//
//  HomeVM.swift
//  remotely
//
//  Created by cagla copuroglu on 30.07.2022.
//

import Foundation
import Core

final class MovieDetailViewModel: MovieDetailViewModelProtocol {

    weak var delegate: MovieDetailViewModelDelegate?

    func load() {
       // delegate?.showDetail(<#T##presentation: <<error type>>##<<error type>>#>)
    }
}
