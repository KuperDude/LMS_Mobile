//
//  AllCourseView.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import SwiftUI
import SwiftfulRouting

struct AllCourseView: View {
    
    @Environment(\.router) var router
    
    @ObservedObject var mainVM: MainViewModel
    @StateObject var vm = AllCourseViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders], content: {
                Section {
                    ForEach(vm.filteredCourses) { product in
                        CourseCell(imageName: product.firstImage, title: product.title)
                            .onTapGesture {
                                router.showScreen(.push) { _ in
                                    CourseDetailView(course: product)
                                }
                            }
                    }
                    .offset(y: -8)
                } header: {
                    ZStack {
                        Rectangle()
                            .frame(maxHeight: .infinity, alignment: .top)
                            .foregroundColor(.theme.background)
                        SearchBarView(searchText: $vm.searchText)
                            .foregroundColor(.theme.accent)
                    }
                }
            })
        }
        .scrollIndicators(.hidden)
        .clipped()
        .ignoresSafeArea(.all, edges: .bottom)
        .padding(.horizontal, 8)
        .onReceive(mainVM.$courses, perform: { courses in
            vm.products = courses
            vm.filteredCourses = courses
        })
    }
}

#Preview {
    RouterView { _ in 
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            AllCourseView(mainVM: MainViewModel())
        }
    }
}
