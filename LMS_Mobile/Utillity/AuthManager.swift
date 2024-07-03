//
//  AuthManager.swift
//  LMS_Mobile
//
//  Created by MyBook on 02.07.2024.
//
import Foundation
import Combine

final actor AuthManager: ObservableObject {
    
    static var instance = AuthManager()
    
    @Published var user: User?
    
    func createAnonymous() {
        self.user = User.mock
    }

}

extension AuthManager: ResetPasswordAllow, Registration {
    func register(username: String, mail: String, password: String) async -> String? {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        createAnonymous()
        return nil
    }
    
    func resetPassword(mail: String, password: String) async throws -> Bool {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return true
    }
    
    func sendCodeOn(mail: String) async throws -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return 100_000
    }
}
