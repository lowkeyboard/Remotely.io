//
//  AuthManager.swift
//  remotely
//
//  Created by cagla copuroglu on 28.03.2022.
//

import Foundation
import Alamofire

class AuthManager {
    
    private  let BASE_URL = "https://reqres.in/api/"
    private  let LOGIN = "login"
    
    private var accessToken: String = ""

    
    
    // Upon success, returns an access token
    func signInWith(email: String, password: String) -> String {
        
        let parameters: [String: String] = [
            "email": email,
            "password": password,
        ]
        
        
        
        AF.request(BASE_URL + LOGIN , method: .post, parameters: parameters, encoding:  JSONEncoding.default).responseJSON(completionHandler: { response in
            
           // debugPrint(response.result)
            switch response.result {
            case let .success(value):
                if let JSON = value as? [String: Any] {
                    let token = JSON["token"] as! String
                    print(token)

                    self.accessToken = token
                }

                
            case let .failure(error):
                print(error)
            }

            
        })
        
        return accessToken
    }
    
    
}

struct Movie: Codable, Hashable {
    let token: String
}
