//
//  MyCourseViewModel.swift
//  LMS_Mobile
//
//  Created by MyBook on 04.07.2024.
//

import Foundation
import Combine

class MyCourseViewModel: ObservableObject {
        
    @Published var activeCourse: [Product] = []
    @Published var readyCourse: [Product] = []
    
    func getData(courses: [Product]) {
        var buyingCourses = courses.filter({ $0.isUserBuyCourse })
        
        activeCourse = buyingCourses.filter({ $0.isActiveCourse })
        
        buyingCourses.removeAll { course in
            activeCourse.contains(where: { $0.title == course.title })
        }
        readyCourse = buyingCourses
    }
    
}
