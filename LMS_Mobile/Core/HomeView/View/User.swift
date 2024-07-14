//
//  User.swift
//  SwiftUIInPractice
//
//  Created by MyBook on 03.07.2024.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName: String
    let age: Int
    let email, phone, username, password: String
    let image: String
    let height, weight: Double
    
    static var mock: User {
        User(
            id: 123,
            firstName: "Greg",
            lastName: "Fields",
            age: 19,
            email: "blabla@gmail.com",
            phone: "123123123",
            username: "user",
            password: "12345",
            image: Constants.randomImage,
            height: 188,
            weight: 67
        )
    }
}
