//
//  MyCoursesView.swift
//  LMS_Mobile
//
//  Created by MyBook on 04.07.2024.
//

import SwiftUI
import SwiftfulRouting

struct MyCoursesView: View {
    
    @Environment(\.router) var router
    
    @ObservedObject var mainVM: MainViewModel
    @State private var isActiveCourses: Bool = true
    @StateObject var vm = MyCourseViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            ScrollViewReader(content: { proxy in
                LazyVStack(spacing: 16, pinnedViews: [.sectionHeaders], content: {
                    Section {
                        
                        Text("")
                            .frame(height: 1)
                            .id("TopId")
                        
                        if isActiveCourses {
                            VStack {
                                ForEach(vm.activeCourse) { product in
                                    CourseCell(imageName: product.firstImage, title: product.title)
                                        .onTapGesture {
                                            router.showScreen(.push) { _ in
                                                CourseDetailView(course: product, stringHTML: Constants.courseUserActivity, showButtomButton: false)
                                            }
                                        }
                                }
                            }
                            .offset(y: -8)
                            .transition(.move(edge: .trailing))
                            
                        } else {
                            VStack {
                                ForEach(vm.readyCourse) { product in
                                    CourseCell(imageName: product.firstImage, title: product.title)
                                        .onTapGesture {
                                            router.showScreen(.push) { _ in
                                                CourseDetailView(course: product, stringHTML: Constants.courseUserActivity, showButtomButton: false)
                                            }
                                        }
                                    
                                }
                            }
                            .offset(y: -8)
                            .transition(.move(edge: .leading))
                            
                        }
                        
                    } header: {
                        ZStack {
                            Rectangle()
                                .frame(maxHeight: .infinity, alignment: .top)
                                .foregroundColor(.theme.background)
                                
                            PickerView(values: ["Активные", "Завершенные"]) { value in
                                withAnimation(.spring()) {
                                    isActiveCourses = value == "Активные"
                                    proxy.scrollTo("TopId", anchor: .bottom)
                                }
                            }
                            .padding()
                        }
                    }
                })
            })
        }
        .scrollIndicators(.hidden)
        .clipped()
        .ignoresSafeArea(.all, edges: .bottom)
        .padding(.horizontal, 8)
        .onReceive(mainVM.$courses, perform: { courses in
            vm.getData(courses: courses)
        })
    }
}

#Preview {
    RouterView { _ in
        ZStack {
            
            Color.theme.background.ignoresSafeArea()
            
            MyCoursesView(mainVM: MainViewModel())
        }
    }
}

