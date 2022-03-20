//
//  OnboardViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 18.03.2022.
//

import UIKit

class OnboardViewController: UIViewController {
    
    private let myView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
        return myView
    }()
    
    private let welcomeLabel: UILabel = {
        let welcomeLabel = UILabel()
        welcomeLabel.text = "WELCOME"
        welcomeLabel.textColor = .RT_Primary
        welcomeLabel.font = UIFont(name: "Avenir Next Bold", size: 13)
    
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return welcomeLabel
    }()
    
    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.text = "Remotely.io"
        titleLabel.textColor = .RT_White
        titleLabel.font = UIFont(name: "Avenir Next Bold", size: 35)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        return titleLabel
    }()
    
    private let descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.text = "We serve you with the best gadgets for your\n home workspace"
        descriptionLabel.textColor = .RT_GreyLight
        descriptionLabel.font = UIFont(name: "Avenir Medium", size: 14)
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.numberOfLines = 0
       

        return descriptionLabel
    }()
    
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "IM_Onboard"))
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()
    
    private let signUpButton: UIButton = {
        let signupbutton = UIButton()
        signupbutton.setTitle("Sign Up", for: .normal)
        signupbutton.setTitleColor(.RT_Black, for: .normal)
        signupbutton.setTitleColor(.RT_GreyLight, for: .selected)

        signupbutton.backgroundColor = .RT_Primary
        signupbutton.translatesAutoresizingMaskIntoConstraints = false
       
        return signupbutton
    }()
    
    private let signInButton: UIButton = {
        let signInButton = UIButton()
        signInButton.setTitle("Log in", for: .normal)
        signInButton.setTitleColor(.RT_Black, for: .normal)
        signInButton.setTitleColor(.RT_GreyLight, for: .selected)

        signInButton.backgroundColor = UIColor.black.withAlphaComponent(0.0)
        signInButton.translatesAutoresizingMaskIntoConstraints = false
       
        return signInButton
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(imageView)

        imageView.addSubview(welcomeLabel)
        imageView.addSubview(titleLabel)
        imageView.addSubview(descriptionLabel)
        
        signUpButton.addTarget(self, action: #selector(self.signUpbuttonAction(sender:)), for: .touchUpInside)
        
        signInButton.addTarget(self, action: #selector(self.signInbuttonAction(sender:)), for: .touchUpInside)
        
        view.addSubview(signUpButton)
        view.addSubview(signInButton)
        
        addConstraints()
        
    }
    
    @objc func signUpbuttonAction(sender: UIButton) {
      print("signUpbuttonAction tapped")
    }
    
    @objc func signInbuttonAction(sender: UIButton) {
      print("signInbuttonAction tapped")
        //navigate to sign in page
    }


    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
     //   add
        //Imageview
        constraints.append(imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(imageView.topAnchor.constraint(equalTo: view.topAnchor))
        
        //welcomeLabel
        
        constraints.append(welcomeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor,constant: 16))

        constraints.append(welcomeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -50))
        constraints.append(welcomeLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 140))
        
        //titleLabel
        
        constraints.append(titleLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor))

        constraints.append(titleLabel.centerXAnchor.constraint(equalTo: welcomeLabel.centerXAnchor))
        constraints.append(titleLabel.centerYAnchor.constraint(equalTo: welcomeLabel.centerYAnchor, constant: 35))
        
        //descriptionLabel
        constraints.append(descriptionLabel.leadingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor))

        constraints.append(descriptionLabel.widthAnchor.constraint(equalTo: imageView.safeAreaLayoutGuide.widthAnchor))

        constraints.append(descriptionLabel.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor, constant: 35))

        //signUpButton
        constraints.append(signUpButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor))

        constraints.append(signUpButton.widthAnchor.constraint(equalTo: descriptionLabel.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9))

        constraints.append(signUpButton.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor, constant: 50))
        
        //signInButton
        constraints.append(signInButton.leadingAnchor.constraint(equalTo: descriptionLabel.leadingAnchor))

        constraints.append(signInButton.widthAnchor.constraint(equalTo: descriptionLabel.safeAreaLayoutGuide.widthAnchor, multiplier: 0.9))

        constraints.append(signInButton.centerYAnchor.constraint(equalTo: descriptionLabel.centerYAnchor, constant: 100))

        //Activate (Applying)
        NSLayoutConstraint.activate(constraints)
        
    }


}
