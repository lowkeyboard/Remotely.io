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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

//        view.addSubview(myView)
        view.addSubview(imageView)

        imageView.addSubview(welcomeLabel)
        imageView.addSubview(titleLabel)
        imageView.addSubview(descriptionLabel)
        
        addConstraints()
        
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

extension UILabel {
    func addCharactersSpacing(spacing:CGFloat, text:String) {
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, text.count-1))
        self.attributedText = attributedString
    }
}
