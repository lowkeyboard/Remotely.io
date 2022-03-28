//
//  ViewController.swift
//  remotely
//
//  Created by cagla copuroglu on 16.03.2022.
//

import UIKit

class LoginViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    var auth: AuthManager = AuthManager.init()
    
    private let signInButton: UIButton = {
        let signupbutton = UIButton( frame: CGRect(x: 500, y: 500, width: 300, height: 100))
        signupbutton.setTitle("Sign Up", for: .normal)
        signupbutton.setTitleColor(.RT_Black, for: .normal)
        signupbutton.setTitleColor(.RT_GreyLight, for: .selected)

        signupbutton.backgroundColor = .RT_Primary
        signupbutton.translatesAutoresizingMaskIntoConstraints = false
       
        return signupbutton
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "login view controller"
        
        signInButton.addTarget(self, action: #selector(self.signInbuttonAction(sender:)), for: .touchUpInside)

        view.addSubview(signInButton)
        auth.signInWith(email: "eve.holt@reqres.in", password: "cityslicka")

    }
    
    @objc func signInbuttonAction(sender: UIButton) {
        var result:String =  auth.signInWith(email: "eve.holt@reqres.in", password: "cityslicka")
    }
    
    
}
