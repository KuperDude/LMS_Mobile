//
//  CourseCell.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import SwiftUI

struct CourseCell: View {
    
    var imageName = Constants.randomImage
    var title = "Основы Django"
    
    var body: some View {
        ZStack {
            
            ImageLoaderView(urlString: imageName, resizingMode: .fill)
                .foregroundStyle(Color.theme.background)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 5, x: 0, y: 0)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
            
            VStack(spacing: 8) {
                
                Text(title)
                    .padding(5)
                    .background {
                        Rectangle()
                            .cornerRadius(10, corners: [.bottomRight, .topLeft])
                            .foregroundColor(Color.theme.red)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .foregroundColor(.theme.accent)
                    
                
                Spacer()
            }
                
        }
        .frame(height: 240)
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 5)
    }
}


#Preview {
    CourseCell()
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners) )
    }
}
