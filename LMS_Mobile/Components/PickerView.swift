//
//  PickerView.swift
//  LMS_Mobile
//
//  Created by MyBook on 02.07.2024.
//

import SwiftUI

struct PickerView: View {
    
    @Namespace var animation
    
    var values: [String?] = []
    @State private var selected: String? = nil
    var onTapAction: (String?)->Void
    
    init(values: [String], onTapAction: @escaping (String?) -> Void) {
        self.values = values
        self.selected = values.first
        self.onTapAction = onTapAction
    }
    
    var body: some View {
        HStack {
            
            ForEach(values, id: \.self) { value in
                Text(value ?? "")
                    .foregroundStyle(Color.theme.accent)
                    .lineLimit(1)
                    .padding()
                    .onTapGesture {
                        withAnimation(.spring) {
                            selected = value
                            onTapAction(value)
                        }
                    }
                .matchedGeometryEffect(id: value, in: animation)
                .frame(maxWidth: .infinity)
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.theme.red)
                .matchedGeometryEffect(id: selected, in: animation, isSource: false)
        }
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.theme.background)
                .padding(.vertical, -5)
                .shadow(
                    color: Color.theme.accent.opacity(0.15),
                    radius: 10, x: 0, y: 0)
        )
    }
}

#Preview {
    PickerView(values: ["Вход", "Регистрация"]) {_ in }
        .padding()
}
