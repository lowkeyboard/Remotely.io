//
//  ViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 16.03.2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    private let myView: UIView = {
        let myView = UIView()
        myView.translatesAutoresizingMaskIntoConstraints = false
//        myView.backgroundColor = .red
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
    
    private let imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "IM_Onboard"))
        imageView.translatesAutoresizingMaskIntoConstraints = false

        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        view.addSubview(myView)
        view.addSubview(imageView)

        imageView.addSubview(welcomeLabel)
        
        addConstraints()
        
    }
    
    private func addConstraints() {
        var constraints = [NSLayoutConstraint]()
        
     //   add
        constraints.append(imageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(imageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
        constraints.append(imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(imageView.topAnchor.constraint(equalTo: view.topAnchor))
        
        constraints.append(welcomeLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor,constant: 16))

        constraints.append(welcomeLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor, constant: -50))
        constraints.append(welcomeLabel.centerYAnchor.constraint(equalTo: imageView.centerYAnchor, constant: 150))

        //Activate (Applying)
        NSLayoutConstraint.activate(constraints)
        
    }
    
    
    
    
    
    
    
    
    
//    private func setupLayout( imageview: UIImageView, textview: UITextView) {
//        //This enables autolayout
//        imageview.translatesAutoresizingMaskIntoConstraints = false
//        textview.translatesAutoresizingMaskIntoConstraints = false
//
//        imageview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//
//        //text
//        textview.text = "WELCOME"
//        textview.textColor = .RT_Primary
//        textview.backgroundColor = .blue
//        textview.isScrollEnabled = false   // causes expanding height
//
//
//
//        NSLayoutConstraint.activate([
//
//        imageview.topAnchor.constraint(equalTo: self.view.topAnchor),
//        imageview.leftAnchor.constraint(equalTo: self.view.leftAnchor),
//        imageview.rightAnchor.constraint(equalTo: self.view.rightAnchor),
//        imageview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
//
//
//        //text
//        textview.topAnchor.constraint(equalTo: imageview.topAnchor),
//        textview.bottomAnchor.constraint(equalTo: imageview.bottomAnchor)
//
//        ])
//    }
    
    


}

