//
//  User.swift
//  LMS_Mobile
//
//  Created by MyBook on 02.07.2024.
//

import Foundation

struct User: Codable, Identifiable, Equatable {
    var id: String
    var firstName: String
    var lastName: String
    var imageURL: String
    
    private enum CodingKeys: String, CodingKey {
        case id
        case firstName = "first_name"
        case lastName = "last_name"
        case imageURL = "photo_50"
    }
    
    var fullName: String {
        return firstName + " " + lastName
    }
}
