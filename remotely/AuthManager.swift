//
//  AuthManager.swift
//  remotely
//
//  Created by cagla copuroglu on 16.03.2022.
//

import Foundation

final class AuthManager {
    static let shared = AuthManager()
    
    private init(){}
    
    public var isSignedIn: Bool {
        return false
    }
    
    private var accessToken: String? {
        return nil
    }
    
    
}
