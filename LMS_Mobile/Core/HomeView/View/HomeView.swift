//
//  HomeView.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import SwiftUI

struct HomeView: View {
    
    @State var searchText = ""
    
    @State var tabSelection: TabBarItem = .allCourse
    
    var body: some View {
        
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            CustomTabBarContainerView(selection: $tabSelection) {
                ScrollView(.vertical) {
                    LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders], content: {
                        Section {
                            ForEach(0..<10) { _ in
                                CourseCell()
                            }
                            .offset(y: -8)
                        } header: {
                            ZStack {
                                Rectangle()
                                    .frame(maxHeight: .infinity, alignment: .top)
                                    .foregroundColor(.theme.background)
                                SearchBarView(searchText: $searchText)
                                    .foregroundColor(.theme.accent)
                            }
                        }
                    })
                }
                .scrollIndicators(.hidden)
                .clipped()
                .ignoresSafeArea(.all, edges: .bottom)
                .padding(.horizontal, 8)
                .tabBarItem(tab: .allCourse, selection: $tabSelection)
                
                Text("Мои курсы")
                    .tabBarItem(tab: .myCourse, selection: $tabSelection)
                
                Text("ДЗ")
                    .tabBarItem(tab: .homework, selection: $tabSelection)
                
                Text("Профиль")
                    .tabBarItem(tab: .profile, selection: $tabSelection)
            }
            
            

        }
    }
}

#Preview {
    HomeView()
}
