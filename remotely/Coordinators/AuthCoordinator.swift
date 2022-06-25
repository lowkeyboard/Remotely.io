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
            // Network manager delegate should handle auth request.
            print("loginbuttontapped event")
        case .loginSelected:
            var vc: UIViewController & Coordinating = LoginViewController()
            vc.coordinator? = self
            navigationController?.pushViewController(vc, animated: true)

        }
    }

    func start() {
        var vc: UIViewController & Coordinating = OnboardViewController()
        vc.coordinator = self
        navigationController?.setViewControllers([vc], animated: false)

    }

}
