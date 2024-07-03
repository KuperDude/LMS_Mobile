//
//  AllCourseViewModel.swift
//  LMS_Mobile
//
//  Created by MyBook on 03.07.2024.
//

import Foundation
import Combine

class AllCourseViewModel: ObservableObject {
    
    var cancellables = Set<AnyCancellable>()
    
    @Published var searchText: String = ""
    @Published var products: [Product] = []
    @Published var filteredProducts: [Product] = []
    private let databaseHelper = DatabaseHelper()
    
    init() {
        subscribers()
    }
    
    @MainActor
    func getData() async {
        guard products.isEmpty else { return }
        do {
            products = try await databaseHelper.getProducts()
            filteredProducts = products
        } catch {
            
        }
    }
    
    func subscribers() {
        
        $searchText
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] text in
                
                guard let products = self?.products else { return }
                
                if text == "" {
                    self?.filteredProducts = products
                } else {
                    self?.filteredProducts = products.filter({ $0.title.capitalized.contains(text.capitalized) })
                }
            }
            .store(in: &cancellables)
            
    }
    
    
}
