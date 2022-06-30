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
    private let welcomeLabel = UILabel()
    private let usernameTextField: UITextField = UITextField()
    private let passwordTextField: UITextField = UITextField()
    private let loginButton: UIButton = UIButton()
    private let googleButton: UIButton = UIButton()
    private let facebookButton: UIButton = UIButton()

    let icon = UIImage(named: "google-icon")
    let fbicon = UIImage(named: "fb-icon")

    // Create Attachment
    let imageAttachment = NSTextAttachment()

    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        self.hideKeyboardWhenTappedAround()
        usernameTextField.text = "cagla@mail.com"
        passwordTextField.text = "123456"

    }

    @objc func loginButtonAction(sender: UIButton) {
      print("loginButtonAction tapped")

        guard let usernameTF = usernameTextField.text, let passwordTF = passwordTextField.text, !usernameTF.isEmpty, !passwordTF.isEmpty else {
            print("empty input handling")
            let alert = UIAlertController(title: "Cannot be left empty.", message: "Please fill in  username and password.", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"Request Failed\" alert occured.")
            }))

                self.present(alert, animated: true, completion: nil)
            return
        }

        let currentUser = NetworkManager.shared.signInWith(email: usernameTF, password: passwordTF)

        self.coordinator?.eventOccured(with: .loginbuttonTapped)

    }

    private func configure() {
        view.addSubview(labelTitle)
        view.addSubview(welcomeLabel)
        view.addSubview(usernameTextField)
        view.addSubview(passwordTextField)

        view.addSubview(loginButton)
        view.addSubview(googleButton)
        view.addSubview(facebookButton)

        loginButton.addTarget(self, action: #selector(self.loginButtonAction(sender:)), for: .touchUpInside)

        DispatchQueue.main.async {
            self.view.backgroundColor = .RTSecondary

            // label configuration
            self.labelTitle.font = .boldSystemFont(ofSize: 25)
            self.labelTitle.text = "Sign in to Remotely.io"
            self.labelTitle.font = UIFont(name: "Arial Hebrew", size: 20)

            let fullString = NSMutableAttributedString(string:"HI FELLA ")

//            self.welcomeLabel.text = "Hi Fella"
            self.welcomeLabel.textColor = .RTWhite
            self.welcomeLabel.font = UIFont(name: "ArialHB", size: 13)
            self.imageAttachment.bounds = CGRect(x: 0, y: -8, width: 25, height: 25)
            self.imageAttachment.image = UIImage(named:"emoji-hand-icon")
            // wrap the attachment in its own attributed string so we can append it
            let image1String = NSAttributedString(attachment: self.imageAttachment)
            // add the NSTextAttachment wrapper to our full string, then add some more text.

            fullString.append(image1String)

            // draw the result in a label
            self.welcomeLabel.attributedText = fullString

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

            // google button configuration
            self.googleButton.setTitle("Sign In with Google", for: .normal)
            self.googleButton.setTitleColor(.RTBlack, for: .normal)
            self.googleButton.titleLabel?.font = UIFont(name: "Avenir Next Light", size: 20)
            self.googleButton.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 0.0)

            self.googleButton.backgroundColor = .RTWhite
            self.googleButton.layer.cornerRadius = 5
            self.googleButton.setImage(self.icon, for: .normal)
            self.googleButton.imageView?.contentMode = .scaleAspectFit
            self.googleButton.imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 0.0)

            // facebook button configuration
            self.facebookButton.setTitle("Sign In with Facebook", for: .normal)
            self.facebookButton.setTitleColor(.RTBlack, for: .normal)
            self.facebookButton.titleLabel?.font = UIFont(name: "Avenir Next Light", size: 20)
            self.facebookButton.titleEdgeInsets = UIEdgeInsets(top: 0.0, left: 20.0, bottom: 0.0, right: 0.0)

            self.facebookButton.setImage(self.fbicon, for: .normal)
            self.facebookButton.imageView?.contentMode = .scaleAspectFit
            self.facebookButton.imageEdgeInsets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 0.0)
            self.facebookButton.backgroundColor = .RTWhite
            self.facebookButton.layer.cornerRadius = 5

        }

        makeLabel()
        makeInput()
        makeLoginButton()
        makeGoogleButton()
        makeFacebookButton()
    }

}

extension LoginViewController {
    func makeLabel() {
        labelTitle.snp.makeConstraints { (make) in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)

        }

        welcomeLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(10)
            make.left.equalTo(view).offset(20)
            make.right.equalTo(view).offset(-10)
            make.height.greaterThanOrEqualTo(10)
        }
    }

    func makeInput() {

        usernameTextField.snp.makeConstraints { make in
            make.top.equalTo(labelTitle.snp.bottom).offset(60)
            make.leading.trailing.equalToSuperview().inset(20)
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

    func makeGoogleButton() {
        googleButton.snp.makeConstraints { make in
            make.top.equalTo(loginButton.snp.bottom).offset(200)
            make.leading.trailing.equalTo(loginButton)
            make.height.greaterThanOrEqualTo(50)

        }
    }

    func makeFacebookButton() {
        facebookButton.snp.makeConstraints { make in
            make.top.equalTo(googleButton.snp.bottom).offset(20)
            make.leading.trailing.equalTo(googleButton)
            make.height.greaterThanOrEqualTo(50)

        }
    }
}
