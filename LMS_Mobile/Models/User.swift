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
    
    var fullName: String {
        return firstName + " " + lastName
    }
}
