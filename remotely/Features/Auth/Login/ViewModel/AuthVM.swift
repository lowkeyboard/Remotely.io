//
//  AuthVM.swift
//  remotely
//
//  Created by cagla copuroglu on 29.06.2022.
//

import FirebaseAuth

class AuthVM {

    func signInWith(email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password)
    }
}
