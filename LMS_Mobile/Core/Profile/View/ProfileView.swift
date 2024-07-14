//
//  ProfileView.swift
//  LMS_Mobile
//
//  Created by MyBook on 04.07.2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    @State private var additionalInfo: String = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("ПЕРСОНАЛЬНАЯ ИНФОРМАЦИЯ")) {
                    TextField("Имя", text: $firstName)
                        .autocapitalization(.words)
                    TextField("Фамилия", text: $lastName)
                        .autocapitalization(.words)
                }
                
                Section(header: Text("АККАУНТ")) {
                    TextField("Логин", text: $username)
                        .autocapitalization(.none)
                    TextField("Email", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                }
                
                Section(header: Text("КОНТАКТНАЯ ИНФОРМАЦИЯ")) {
                    TextField("Номер телефона", text: $phoneNumber)
                        .keyboardType(.phonePad)
                }
                
                Button(action: {
                    // Action to save profile data
                    saveProfile()
                }) {
                    Text("Сохранить")
                        .frame(maxWidth: .infinity, alignment: .center)
                }
                .padding()
            }
            .navigationTitle("Профиль")
        }
    }
    
    func saveProfile() {
        // Implement saving functionality here
        print("Profile saved:")
        print("First Name: \(firstName)")
        print("Last Name: \(lastName)")
        print("Username: \(username)")
        print("Email: \(email)")
        print("Phone Number: \(phoneNumber)")
        print("Additional Info: \(additionalInfo)")
    }
}

#Preview {
    ProfileView()
}
