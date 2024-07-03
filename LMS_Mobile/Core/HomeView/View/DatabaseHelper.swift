//
//  DatabaseHelper.swift
//  SwiftUIInPractice
//
//  Created by MyBook on 03.07.2024.
//

import Foundation

struct DatabaseHelper {
    
    func getProducts() async throws -> [Product] {
        
        let urlString = "https://dummyjson.com/products"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let products = try JSONDecoder().decode(ProductArray.self, from: data)
        
        return products.products
        
    }
    
    func getUsers() async throws -> [User] {
        
        let urlString = "https://dummyjson.com/users"
        
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let users = try JSONDecoder().decode(UserArray.self, from: data)
        
        return users.users
        
    }
}
