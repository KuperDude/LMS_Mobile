//
//  MainViewModel.swift
//  LMS_Mobile
//
//  Created by MyBook on 02.07.2024.
//

import Foundation
import SwiftUI

class MainViewModel: ObservableObject {
    
    @Published var user: User?
    @Published var courses: [Product] = []
    private let databaseHelper = DatabaseHelper()
    
    init(user: User? = nil) {
        self.user = user
    }
    
    @MainActor
    func getData() async {
        guard courses.isEmpty else { return }
        do {
            courses = try await databaseHelper.getProducts()
        } catch {
            
        }
    }
    
    func isUserAnonymous() -> Bool {
        //user?.id == "Anonymous"
        return false
    }
    
    func moveToLoginView() {
        //AuthManager.instance.user = nil
        user = nil
    }
    
}

// MARK: - User Intents
extension MainViewModel {
    
}
