//
//  NetworkManager.swift
//  remotely
//
//  Created by cagla copuroglu on 30.06.2022.
//

import FirebaseAuth
import UIKit

class NetworkManager {

    static let shared = NetworkManager()

    func signInWith(email: String, password: String) -> String {
        Auth.auth().signIn(withEmail: email, password: password)

        return Auth.auth().currentUser?.email ?? "unknown user"

    }
}
