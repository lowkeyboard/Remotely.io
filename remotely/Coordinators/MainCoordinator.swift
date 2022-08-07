//
//  MainCoordinator.swift
//  remotely
//
//  Created by cagla copuroglu on 6.08.2022.
//

import UIKit
import PokemonAPI

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController?
    var children: [Coordinator]?
    var childCoordinators = [Coordinator]()
    var feedCoordinator: FeedCoordinator?
    let service = PokemonService()

    init(navigationController: UINavigationController, feedCoordinator: FeedCoordinator) {
        self.navigationController = navigationController
        self.feedCoordinator = feedCoordinator
    }

    func start() {
        let vc = OnboardViewController()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: false)

    }

    func navigateLogin() {
        let vc = LoginViewController()
        vc.coordinator = self
        navigationController?.pushViewController(vc, animated: true)
    }

    func navigateToHome() {
        let vc = HomeViewController()
        vc.viewModel = HomeViewModel(service: service, coordinator: feedCoordinator!)

        navigationController?.pushViewController(vc, animated: true)

    }

    // details
    func viewPokemonList() {
        let child = FeedCoordinator(navigationController: navigationController!)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if coordinator === child {
                childCoordinators.remove(at: index)
                break
            }
        }

    }

}
