//
//  CourseDetailHeaderView.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import SwiftUI
import SwiftfulUI

struct CourseDetailHeaderView: View {
    
    var height: CGFloat = 300
    var title = "Some title course"
    var subtitle = "Subtitle goes here"
    var imageName = Constants.randomImage
    var shadowColor: Color = .theme.background.opacity(0.8)
    
    
    var body: some View {
        Rectangle()
            .opacity(0)
            .overlay {
                ImageLoaderView(urlString: imageName)
            }
            .overlay(
                VStack(alignment: .leading, spacing: 8) {
                    Text(subtitle)
                        .font(.headline)
                    
                    Text(title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                }
                .foregroundColor(.theme.accent)
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(
                    LinearGradient(
                        colors: [shadowColor.opacity(0), shadowColor],
                        startPoint: .top, endPoint: .bottom
                    )
                )

                , alignment: .bottomLeading
            )
            .asStretchyHeader(startingHeight: height)
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
            CourseDetailHeaderView()
        }
        .ignoresSafeArea()
    }
    
}
