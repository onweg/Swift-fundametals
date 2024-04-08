//
//  User.swift
//  Message
//
//  Created by Пользователь on 08.04.2024.
//

import Foundation

struct User: Codable, Identifiable {
    var id = NSUUID().uuidString
    let fullname: String
    let email: String
    var profileImageURL: String?
}

extension User{
    static let MOCK_USER = User(fullname: "Arkadiy Frolkin", email: "gmail@gmail.com" , profileImageURL: "user")
}
