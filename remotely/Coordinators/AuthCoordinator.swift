//
//  AuthCoordinator.swift
//  remotely
//
//  Created by cagla copuroglu on 25.03.2022.
//

import Foundation
import UIKit

class AuthCoordinator: Coordinator {

    var navigationController: UINavigationController?

    func eventOccured(with type: AuthEvent) {
        switch type {
        case .loginbuttonTapped:
//            var vc: UIViewController & Coordinating = HomeViewController()
            var vc: UIViewController & Coordinating = RickyMortyViewController()
            vc.coordinator? = self
            navigationController?.pushViewController(vc, animated: true)

        case .loginSelected:
            var vc: UIViewController & Coordinating = LoginViewController()
            vc.coordinator? = self
            navigationController?.pushViewController(vc, animated: true)

        }
    }

    func start() {
        var vc: UIViewController & Coordinating = OnboardViewController()
        vc.coordinator = self

        var vc1: UIViewController & Coordinating = LoginViewController()
        vc1.coordinator = self

        navigationController?.setViewControllers([vc, vc1], animated: false)

    }

}
