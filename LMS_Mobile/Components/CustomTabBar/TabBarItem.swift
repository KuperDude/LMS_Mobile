//
//  TabBarItem.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import Foundation
import SwiftUI

enum TabBarItem: Hashable {
    case allCourse, myCourse, homework, profile
    
    var iconName: String {
        switch self {
        case .allCourse: return "graduationcap"
        case .myCourse: return "text.book.closed"
        case .homework: return "pencil.and.ruler"
        case .profile: return "person"
        }
    }
    
    var title: String {
        switch self {
        case .allCourse: return "Курсы"
        case .myCourse: return "Мои курсы"
        case .homework: return "ДЗ"
        case .profile: return "Профиль"
        }
    }
    
    var color: Color {
        switch self {
        case .allCourse: return Color.red
        case .myCourse: return Color.blue
        case .homework: return Color.green
        case .profile: return Color.orange
        }
    }
}
