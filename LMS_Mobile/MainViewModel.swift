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
    
    init(user: User? = nil) {
        self.user = user
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
