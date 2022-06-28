//
//  ViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 16.03.2022.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    private let labelTitle: UILabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }

    private func configure() {
        view.addSubview(labelTitle)
        DispatchQueue.main.async {
            self.view.backgroundColor = .RTSecondary
            self.title = "login view controller"
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = "Hi Fella"
        }

        makeLabel()
    }

}

extension LoginViewController {
    func makeLabel() {
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(10)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }
}
