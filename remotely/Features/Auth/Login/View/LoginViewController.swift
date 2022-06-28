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
    private let usernameTextField: UITextField = UITextField()
    private let passwordTextField: UITextField = UITextField()
    private let loginButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()

    }

    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)

        DispatchQueue.main.async {
            self.view.backgroundColor = .RTSecondary

            // label configuration
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = "Sign in to Remotely.io"
            self.labelTitle.font = UIFont(name: "Avenir Next Bold", size: 20)

            // input configuration
            self.usernameTextField.placeholder = "eg. jamesblack@gmail.com"
            self.usernameTextField.backgroundColor = .white
            self.usernameTextField.borderStyle = .roundedRect

            self.passwordTextField.placeholder = "eg. password"
            self.passwordTextField.backgroundColor = .white
            self.passwordTextField.borderStyle = .roundedRect

            // login button configuration
            self.loginButton.setTitle("Sign In", for: .normal)
            self.loginButton.setTitleColor(.RTBlack, for: .normal)
            self.loginButton.setTitleColor(.RTGreyLight, for: .selected)
            self.loginButton.titleLabel?.font = UIFont(name: "Avenir Next Light", size: 20)

            self.loginButton.backgroundColor = .RTPrimary
            self.loginButton.layer.cornerRadius = 5

        }

        makeLabel()
        makeInput()
        makeLoginButton()
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

    func makeInput() {
        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(30)
            make.leading.trailing.equalToSuperview().inset(10)
            make.height.greaterThanOrEqualTo(50)

        }
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(usernameTextField.snp.bottom).offset(10)
            make.leading.trailing.equalTo(usernameTextField)
            make.height.greaterThanOrEqualTo(50)
        }
    }

    func makeLoginButton() {
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(20)
            make.leading.trailing.equalTo(usernameTextField)
            make.height.greaterThanOrEqualTo(50)

        }
    }
}
