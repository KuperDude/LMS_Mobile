//
//  CourseDetailView.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import SwiftUI
import SwiftfulRouting

struct CourseDetailView: View {
    
    @Environment(\.router) var router
    
    var course: Product = .mock
    var stringHTML: String = Constants.courseDescription
    var showButtomButton = true
    
    @State private var webViewHeight: CGFloat = .zero
    @State private var showHeader: Bool = false
    
    var body: some View {
        ZStack {
            Color.theme.background.ignoresSafeArea()
            
            ScrollView {
                CourseDetailHeaderView(title: course.title, subtitle: course.brand ?? "", imageName: course.firstImage)
                    .readingFrame { frame in
                        showHeader = frame.maxY < 150
                    }
                
                HTMLStringView(htmlContent: stringHTML,  webViewHeight: $webViewHeight)
                .frame(height: webViewHeight + 100)
            }
            .scrollIndicators(.hidden)
            .ignoresSafeArea()
            
            header
                .frame(maxHeight: .infinity, alignment: .top)
            
            if showButtomButton {
                if course.isUserBuyCourse {
                    Text("Вы уже записаны")
                        .forgotPasswordButtonStyle()
                        .frame(maxHeight: .infinity, alignment: .bottom)
                        .opacity(0.7)
                } else {
                    ForgotPasswordBottomButton(title: "Записаться") {
                        //
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
            
       }
        .toolbar(.hidden, for: .navigationBar)
    }
}

#Preview {
    RouterView { _ in
        CourseDetailView()
    }
}

extension CourseDetailView {
    
    private var header: some View {
        ZStack {
            Text(course.title)
                .font(.headline)
                .padding(.vertical, 20)
                .frame(maxWidth: .infinity)
                .background(Color.theme.background)
                .offset(y: showHeader ? 0 : -40)
                .opacity(showHeader ? 1 : 0)
            
            Image(systemName: "chevron.left")
                .font(.title3)
                .padding(10)
                .background(showHeader ? .black.opacity(0.001) : Color.theme.secondaryText.opacity(0.7))
                .clipShape(Circle())
                .onTapGesture {
                    router.dismissScreen()
                }
                .padding(.leading, 16)
                .frame(maxWidth: .infinity, alignment: .leading)
                
        }
        .foregroundStyle(Color.theme.accent)
        .animation(.smooth(duration: 0.2), value: showHeader)
    }
}
