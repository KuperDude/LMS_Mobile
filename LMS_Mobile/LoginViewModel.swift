//
//  LoginViewModel.swift
//  LMS_Mobile
//
//  Created by MyBook on 02.07.2024.
//


import Foundation

protocol Registration: SendCodeAllow {
    func register(username: String, mail: String, password: String) async -> String?
}

class LoginViewModel: ObservableObject {
    var authService: AuthManager
    @Published var user: User?
    
    @Published var username: String = ""
    @Published var mail: String = ""
    
    @Published var password1: String = ""
    @Published var password2: String = ""
    
    @Published var alertStatus: AlertStatus?
    @Published var customErrorDescription: String?
    
    enum AlertStatus: String {
        case noEqualPassword = "Пароли не совпадают!"
        case smallPassword   = "Пароль должен содержать не менее 8 символов!"
        case usernameIsEmpty = "Введите имя пользователя!"
        case noExistMail     = "Данной почты не существует!"
        case custom = ""
    }
    
    func errorText(_ status: AlertStatus?) -> String? {
        guard let status = status else { return nil }
        switch status {
        case .custom: return customErrorDescription
        default: return status.rawValue
        }
    }
    
    init(user: User?) {
        self.user = user
        self.authService = AuthManager.instance
        
        addPublishers()
    }
    
    private func addPublishers() {
//        authService.$user
//            .receive(on: DispatchQueue.main)
//            .sink { [weak self] data in
//                if let user = data {
//                    self?.user = user
//                }
//            }
//            .store(in: &cancellables)
    }
    
    // MARK: - User Intents
    func register() async {
        guard let error = await authService.register(username: username, mail: mail, password: password1) else {
            user = await authService.user
            return
        }
        
        customErrorDescription = error
        alertStatus = .custom
    }

    func checkCurrectData() -> Bool {
        if password1.count < 8 || password2.count < 8 {
            alertStatus = .smallPassword
            return false
        }
        if password1 != password2 {
            alertStatus = .noEqualPassword
            return false
        }
        if username.isEmpty || !checkCurrectUsername() {
            alertStatus = .usernameIsEmpty
            return false
        }
        
        return true
    }
    
    private func checkCurrectUsername() -> Bool {
        for i in "username" {
            if i != " " {
                return true
            }
        }
        return false
    }
}

