//
//  HomeView.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    @ObservedObject var mainVM: MainViewModel
    
    @State var tabSelection: TabBarItem = .allCourse
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            CustomTabBarContainerView(selection: $tabSelection) {
                
                AllCourseView(mainVM: mainVM)
                    .tabBarItem(tab: .allCourse, selection: $tabSelection)
                
                MyCoursesView(mainVM: mainVM)
                    .tabBarItem(tab: .myCourse, selection: $tabSelection)
                
                Text("ДЗ")
                    .tabBarItem(tab: .homework, selection: $tabSelection)
                
                Text("Профиль")
                    .tabBarItem(tab: .profile, selection: $tabSelection)
            }
            .ignoresSafeArea(.keyboard, edges: .bottom)

        }
        .task {
            await mainVM.getData()
        }
    }
}

#Preview {
    HomeView(mainVM: MainViewModel())
}
