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
                //HomeView(mainVM: MainViewModel())
                LoginView(mainVM: MainViewModel())
            }
        }
    }
}

extension UINavigationController: UIGestureRecognizerDelegate {
    override open func viewDidLoad() {
        super.viewDidLoad()
        interactivePopGestureRecognizer?.delegate = self
    }
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return viewControllers.count > 1
    }
}
