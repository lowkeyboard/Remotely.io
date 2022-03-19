//
//  OnboardViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 18.03.2022.
//

import UIKit

class OnboardViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       let imageView = UIImageView(image: UIImage(named: "IM_Onboard"))
            
        view.addSubview(imageView)

        setupLayout(imageview: imageView)

        
    }
    
    private func setupLayout( imageview: UIImageView) {
        //This enables autolayout
        imageview.translatesAutoresizingMaskIntoConstraints = false

        imageview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
//        imageview.widthAnchor.constraint(equalToConstant: 200).isActive = true
//        imageview.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        imageview.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        imageview.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        imageview.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        imageview.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true

    }
    
    


}

