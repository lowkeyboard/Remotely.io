//
//  UserModel.swift
//  remotely
//
//  Created by cagla copuroglu on 29.06.2022.
//
import Foundation

struct User {
    var id: String
    var email: String
    var username: String

    init(id: String = "",
         email: String = "",
         username: String = "") {
        self.id = id
        self.email = email
        self.username = username
    }

    init(data: [String: Any]) {
        id = data["id"] as? String ?? UUID().uuidString
        email = data["email"] as? String ?? ""
        username = data["username"] as? String ?? ""
    }

    static func modelToData(user: User) -> [String: Any] {
        let data : [String: Any] = [
            "id" : user.id,
            "email" : user.email,
            "username" : user.username]

        return data
    }

}
