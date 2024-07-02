//
//  LMS_MobileApp.swift
//  LMS_Mobile
//
//  Created by MyBook on 02.07.2024.
//

import SwiftUI
import SwiftfulRouting

@main
struct LMS_MobileApp: App {
    var body: some Scene {
        WindowGroup {
            RouterView { _ in
                LoginView(mainVM: MainViewModel())
            }
        }
    }
}
