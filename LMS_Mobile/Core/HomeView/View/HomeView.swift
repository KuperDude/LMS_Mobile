//
//  HomeView.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var tabSelection: TabBarItem = .allCourse
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            CustomTabBarContainerView(selection: $tabSelection) {
                
                AllCourseView()
                    .tabBarItem(tab: .allCourse, selection: $tabSelection)
                
                Text("Мои курсы")
                    .tabBarItem(tab: .myCourse, selection: $tabSelection)
                
                Text("ДЗ")
                    .tabBarItem(tab: .homework, selection: $tabSelection)
                
                Text("Профиль")
                    .tabBarItem(tab: .profile, selection: $tabSelection)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)

        }
    }
}

#Preview {
    HomeView()
}
