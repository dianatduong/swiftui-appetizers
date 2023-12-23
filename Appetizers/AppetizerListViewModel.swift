//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by Diana Duong on 12/21/23.
//

import SwiftUI

final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [AppetizerData] = []
    @Published var alertItem: AlertItem?
    
    func getAppetizers() {
        NetworkManager.shared.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                switch result {
                case .success(let appetizers):
                    self.appetizers = appetizers
                case .failure(let error):
                    //print(error.localizedDescription)
                    switch error {
                        case .invalidData:
                            alertItem = AlertContext.invalidData
                        
                        case .invalidURL:
                            alertItem = AlertContext.invalidURL
                        
                        case .invalidResponse:
                            alertItem = AlertContext.invalidResponse
                        
                        case .unableToComplete:
                            alertItem = AlertContext.unableToComplete
                    }
                }
            }
        }
    }
}
