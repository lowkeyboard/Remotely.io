//
//  Coordinator.swift
//  remotely
//
//  Created by cagla copuroglu on 25.03.2022.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var navigationController: UINavigationController? { get set }
    var children: [Coordinator]? { get set } // to control coordinators as if they're child coordinators.
    func start()
}
