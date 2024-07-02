//
//  AuthManager.swift
//  LMS_Mobile
//
//  Created by MyBook on 02.07.2024.
//
import Foundation
import Combine

final class AuthManager: ObservableObject {
    
    static var instance = AuthManager()
    
    @Published var user: User?

}

extension AuthManager: SendCodeAllow {
    func resetPassword(mail: String, password: String) async throws -> Bool {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return true
    }
    
    func resetPasswordSendCode(mail: String) async throws -> Int {
        try? await Task.sleep(nanoseconds: 2_000_000_000)
        return 100_000
    }
}
