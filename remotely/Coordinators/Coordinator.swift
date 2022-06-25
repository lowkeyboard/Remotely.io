//
//  Coordinator.swift
//  remotely
//
//  Created by cagla copuroglu on 25.03.2022.
//

import Foundation
import UIKit

enum AuthEvent {
    case loginSelected // the log in string in the onboard screen.
    case loginbuttonTapped // the login button located in login screen.
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    // var children: [Coordinator]? { get set } to control coordinators as if they're child coordinators.

    func eventOccured(with type: AuthEvent)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
